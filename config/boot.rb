#-- encoding: UTF-8
#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2017 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2017 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See doc/COPYRIGHT.rdoc for more details.
#++

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

# Load any local boot extras that is kept out of source control
# (e.g., silencing of deprecations)
if File.exists?(File.join(File.dirname(__FILE__), 'additional_boot.rb'))
  instance_eval File.read(File.join(File.dirname(__FILE__), 'additional_boot.rb'))
end


require 'bundler/setup' # Set up gems listed in the Gemfile.

# Rails is not yet loaded here
if ENV['RAILS_ENV'] == 'development'
  $stderr.puts "Starting with bootsnap."

  require 'bootsnap'

  is_mac = RUBY_PLATFORM.include? 'darwin'
  Bootsnap.setup(
    cache_dir:            'tmp/cache', # Path to your cache
    development_mode:     true,
    load_path_cache:      true,        # Should we optimize the LOAD_PATH with a cache?
    autoload_paths_cache: true,        # Should we optimize ActiveSupport autoloads with cache?
    disable_trace:        false,       # Sets `RubyVM::InstructionSequence.compile_option = { trace_instruction: false }`
    compile_cache_iseq:   is_mac,      # Should compile Ruby code into ISeq cache?
    compile_cache_yaml:   is_mac       # Should compile YAML into a cache?
  )
end
