module Sapphire
  module Testing
    module TestRunnerAdapter

      def execute(id)

        self.backgrounds.each do |b|

          b.execute id

        end

        self.givens.each do |g|

          g.when.each do |w|

            g.execute id

            g.and.each do |g_a|

              g_a.execute id

            end

            w.execute id

            w.and.each do |w_a|

              w_a.execute id

            end

            w.then.each do |t|

              t.execute id

              t.and.each do |t_a|

                t_a.execute id

              end

            end

          end

          if(g.finally)

            g.finally.execute id

          end

        end

      end

    end
  end
end



