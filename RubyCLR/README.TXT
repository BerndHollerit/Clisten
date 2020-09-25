= RubyCLR -- Ruby to CLR Bridge

Supporting: RubyCLR Drop 3

This package contains RubyCLR, a Ruby to CLR interop layer that enables seamless
integration of Ruby and .NET objects in the same Win32 process.

RubyCLR has the following features:

* Reference .NET assemblies by assembly name or by filename 
* Create and manipulate .NET reference and value types
* Automatically marshal .NET reference and value types to / from Ruby
* Dynamic generation of interop code using CIL instructions
* Create and manipulate generic .NET reference types
* Discover and consume .NET interfaces on a .NET object
* Implement .NET event handlers using Ruby blocks
* Map .NET member names to Ruby names (e.g. WordCount becomes word_count)
* Mix in Ruby Enumerable support for .NET IEnumerable types
* Dynamically access .NET XML documentation from irb (requires text/format - to
  make it work uncomment require in rubyclr.rb)

== Download

The latest version of RubyCLR can be found at http://www.iunknown.com/

== Installation

This drop requires setting the RUBY_LIB environment variable. You must run
setup.cmd in the top project directory of RubyCLR to correctly setup this
environment variable. Future versions will be gem-ified for a better user
experience.

=== Running the Rake Test Suite

If you wish to run the unit and functional tests that come with RubyCLR:

* CD to the top project directory of RubyCLR and type:

    rake tests

=== Seeing project statistics

If you want to see the project statistics (# non-blank lines) broken out by
category, CD to the top project directory of RubyCLR and type:

    rake stats

== Online Resources

See John Lam's blog at http://www.iunknown.com to follow the progress of
RubyCLR. The RSS feed can be found at http://feeds.feedburner.com/LessIsBetter/.
Watch for a new online home for RubyCLR in the near future.

== Road Map

The next release (Drop 4) of RubyCLR will likely be the Beta 1 release. It will
likely be hosted on rubyforge, along with an accompanying web site and mailing
list. See the TODO file for a detailed list of tasks remaining until Beta 1.

== Credits

A big thanks to the members of the RubyCLR community for your support and
encouragement in the early stages of this project. Thanks to Mark Miller,
Justin Bailey, Thibaut Barrere, Valentin Iliescu, Scott Hanselman, and Gunter
Szoldaris for contributing code, patches, users and ideas.

== License

RubyCLR is available under an MIT-style license.

:include: MIT-LICENSE.TXT

= Administrivia

Author::   John Lam <jlam@iunknown.com>
Requires:: Ruby 1.8.2 (has not been tested on 1.8.4, but should probably work)
           .NET Framework 2.0
           February 2006 WinFX CTP only if you want to run the WPF samples
           text-format gem for Type.help feature (disabled by default)
License::  Copyright 2005, 2006 by John Lam.
           Released under an MIT-style license.  See the MIT-LICENSE.TXT file
           included in the distribution.