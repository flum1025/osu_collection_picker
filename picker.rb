# Coding: UTF-8
require 'json'
require 'fileutils'

@SourcePath = File.expand_path('../', __FILE__)
require File.join(@SourcePath, "osu_api.rb")

api_key = ""
osu_api = Osu_Application.new(api_key)

count = 0
beatmapset_ids = []
open(File.join(@SourcePath, "beatmaps.txt")) {|file|
  while l = file.gets
    count += 1;p count
    if l.match(/osu.ppy.sh\/b\/(\d+)/)
      beatmapset_ids << osu_api.osu_api("/api/get_beatmaps", "&b=#{$1}")[1][0]["beatmapset_id"]
    end
  end
}
File.write(File.join(@SourcePath, "beatmapset.txt"), beatmapset_ids.join(","))

#beatmapset_ids = File.open(File.join(@SourcePath, "beatmapset.txt")).read.split(",")
  
FileUtils.mkdir_p(File.join(@SourcePath, "beatmapset")) unless FileTest.exist?(File.join(@SourcePath, "beatmapset"))

count = 0
path = ''
dirs = Dir.glob(("#{File.expand_path(path)}/**"))
dirs.each {|d|
  count += 1;p count
  next unless FileTest.directory?(d)
  beatmapset_ids.each do |id|
    next if FileTest.exist?(File.join(@SourcePath, "beatmapset", id))
    if d =~ /^#{File.expand_path(path)}\/#{id}$/ || d =~ /^#{File.expand_path(path)}\/#{id}\s/
      begin
        FileUtils.cp_r(d, File.join(@SourcePath, "beatmapset", id))
      rescue
        next
      end
      p d
    end
  end
}
