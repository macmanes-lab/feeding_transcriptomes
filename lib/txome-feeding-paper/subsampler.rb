module TxomeFeeding

  # The subsampler class takes care of subsampling the raw reads for an
  # experiment, generating the various sizes of read subset.
  class Subsampler

    def initialize(reads,
                   sizes = [10, 20, 50, 75, 100]
                   seed = 1337)
      @left = reads[:left]
      @right = reads[:right]
      @sizes = sizes
      @seed = seed
    end

    def each
      @sizes.each do |n|
        subsetsize = n * 1e6
        samplefiles = []
        [@left, @right].each do |readfile|
          samplefile = "#{n}M_#{readfile}"
          cmd = "seqtk sample"
          cmd += " -s #{seed}"
          cmd += " #{readfile}"
          cmd += " #{subsetsize}"
          cmd += " > #{samplefile}"
          process = Cmd.new cmd
          process.run
          unless process.status.success?
            errmsg = "While trying to subset reads file: #{readfile} " +
                     "seqtk command failed to run. Command output: " +
                     "#{process.stdout}\n#{process.stderr}"
            raise StandardError.new errmsg
          end
          samplefiles << samplefile
        end
        yield samplefiles
      end
    end

  end # Subsampler

end # TxomeFeeding
