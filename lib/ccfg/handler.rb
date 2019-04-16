module Ccfg

  # CLI command handler.
  class Handler < Cmdlib::Command
    include Ccfg

    def parse_line(line, deflist)
      if line.length > 0 then
	    if line.include? Ccfg::CCONFIGURE_DEFINE_DIRECTIVE then
          line.strip!
          lineary = line.split(' ')
          if lineary.size >=2 and lineary[0] == Ccfg::CCONFIGURE_DEFINE_DIRECTIVE then
            deflist.each do |defname, defval|
              if defname == lineary[1] then
                line = "#define #{defname} #{defval}"
                if lineary.size > 2 then
                  comment = ''
                  tail = ''
                  lineary.each do |e|
                    tail += "#{e} "
                  end
                  if tail.include? "//" then
                    comment = tail[tail.index("//") + "//".length, tail.length]
                    comment.strip!
                    comment = " //#{comment}"
                  elsif tail.include? "/*" then
                    start_index = tail.index("/*") + "/*".length
                    len = tail.index("*/") - start_index
                    comment = tail[start_index, len]
                    comment.strip!
                    comment = " /*#{comment} */"
                  end
                  line += comment
                end
                return line
              end
            end
            line = "/* #undef #{lineary[1]} */"
          end
        end
      end
      return line
    end

    def handler ( global_options, args )
      if args.size == 0 then
      	puts "Error: to few arguments for command."
      	exit
      end
      input = args[0]
      args.delete_at(0)
      cconfigure_definition_list = {}
      # Get options from STDIN.
      args.each do |a|
      	keyval = []
      	if a.include? '=' then
      	  keyval = a.split('=')
      	else
      	  keyval << a
      	  keyval << ""
      	end
      	cconfigure_definition_list[keyval[0]] = keyval[1]
      end
      # Set output file from option or STDOUT.
      if global_options[:output].value != nil then
      	fout = File.new( global_options[:output].value, 'w' )
      end
      # Start to parse lines.
      File.open( input, 'r' ).readlines.each do |line|
        line = parse_line line, cconfigure_definition_list
        if global_options[:output].value != nil
          fout.puts line
        else
          puts line
        end
      end
      # Close file if option will be set.
      if global_options[:output].value != nil then
        fout.close
      end
    end
  
  end # class Handler

end # module Ccfg
