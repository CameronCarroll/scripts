#!/usr/bin/ruby
# script file: cpufreq.rb
# author: cameron carroll; created july 2013
# purpose: returns a readable version of cpu frequencies

def get_current_frequency
  puts `grep \"cpu MHz\" /proc/cpuinfo`
end

get_current_frequency