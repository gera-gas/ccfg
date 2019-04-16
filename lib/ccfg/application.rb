module Ccfg

  # Class for application control methods.
  class Application
    include Ccfg

    def initialize
      # Create application.
      @app = Cmdlib::App.new( 'ccfg' )
      @app.about << 'Command line tool to generate C/C++ configure files.'
      @app.usage << 'ccfg <input file> -o <output file> [DEFINITION LIST...].'
      # Add options to application.
      @app.addopt Cmdlib::Option.new( 'o', 'output', 'Option set output file (default STDOUT).', true )
      # Add commands to application.
      @app.default Handler.new
      # Start application.
      @app.run
    end
  
  end # class Application

end # module Ccfg
