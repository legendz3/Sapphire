require 'rake'
require 'json'

module Sapphire
  module Testing
    class RakeTask
      attr_accessor :pattern
      attr_accessor :verbose
      attr_accessor :fail_on_error
      attr_accessor :name


      def test_outcome(result)

        result.results.each do |r|

          if(r.type == 'fail')
            return 'fail'
          end

          if(r.type == 'pending')
            return 'pending'
          end

          if(!r.results.empty?)
            return test_outcome(r)
          end

        end

        return 'pass'

      end

      def initialize(*args)

        @name = args.shift || :spec
        @pattern = nil
        @verbose, @fail_on_error = true, true

        yield self if block_given?

        Rake::Task.define_task name do
          RakeFileUtils.send(:verbose, verbose) do
            files_to_run = FileList[ pattern ].map { |f|
              y = nil
              x = nil
              x = f.gsub(/"/, '\"') if f != nil
              y = x.gsub(/'/, "\\\\'") if x != nil
              y
            }
            if files_to_run.empty?
              puts "No examples matching #{pattern} could be found"
            else
              begin

                files_to_run.each do |f|
                  next unless f != nil
                  require File.expand_path("../../" + f.to_s, __FILE__) unless File.directory? f
                end

                success_array = []
                pending_array = []
                failure_array = []

                i = 3

                Runner.instance.scenarios.each do |scenario|
                  i += 1
                  scenario.execute i
                  scenario.result.set_id i
                  scenario.result.set_type test_outcome(scenario.result)

                  success_array << scenario.result if scenario.result.type == "pass"
                  pending_array << scenario.result if scenario.result.type == "pending"
                  failure_array << scenario.result if scenario.result.type == "fail"
                end

                item_array = []
                item_array << ResultsList.new("Passing", success_array, 1)
                item_array << ResultsList.new("Pending", pending_array, 2)
                item_array << ResultsList.new("Failing", failure_array, 3)


                File.open(File.dirname(__FILE__) + "/../ReportGenerator/output.json", "w") do |file|
                  file.puts ActiveSupport::JSON.encode item_array
                end

                Runner.instance.scenarios.each do |scenario|
                    File.open(File.dirname(__FILE__) + "/../ReportGenerator/" + scenario.result.myId.to_s + ".json", "w") do |file|
                      file.puts ActiveSupport::JSON.encode scenario.result
                  end
                end

              rescue => e
                stack = ""
                e.backtrace.each do |line|
                  stack += "\r\n" + line
                end

                raise("Some tests have failed: " + e.message + " : " +  stack) if fail_on_error
              end
            end
          end
        end
      end
    end
  end
end