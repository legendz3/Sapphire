module Sapphire
  module Testing
    module RSpecRunner
      def execute(id)
        @block.call
        s = self
        x = @givens
        y = @backgrounds
        background_pending = false

        y.each do |background|
          if(background.value.instance_of? Pending)
            background_pending = true
          end
        end

        x.each do |g|
        describe g.text do

          before :all do
            y.each do |b|
              if(!b.value.instance_of? Pending and !s.value.instance_of? Pending)
                b.block.call()
              end
            end
          end

          before :each do
            if(!g.value.instance_of? Pending and !s.value.instance_of? Pending and !background_pending)
              g.block.call()
              g.and.each do |a|
                a.block.call()
              end
            end
          end

          g.when.each do |w|
            describe w.text do
              before do
                if(!w.value.instance_of? Pending and !s.value.instance_of? Pending and !background_pending)
                  w.block.call()

                  if (w.and.count > 0)
                    w.and.each do |a|
                      a.block.call()
                    end
                  end
                end
              end

              if (w.then.count > 0)
                w.then.each do |t|
                  if(!t.value.instance_of? Pending and !w.value.instance_of? Pending and !g.value.instance_of? Pending and !s.value.instance_of? Pending and !background_pending)
                    it t.text do
                      t.block.call()
                      t.and.each do |a|
                        if(!a.value.instance_of? Pending)
                          a.block.call()
                        end
                      end
                    end
                  else
                    pending t.text
                  end
                end
              end
            end
          end

          after :all do
            if(g.finally and !g.finally.value.instance_of? Pending and !s.value.instance_of? Pending and !background_pending)
              g.finally.block.call()

              g.finally.and.each do |a|
                a.block.call()
              end
            end
          end
          end
        end
      end
    end
  end
end

