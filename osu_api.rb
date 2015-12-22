# Coding: UTF-8
require 'open-uri'
require 'json'
@SourcePath = File.expand_path('../', __FILE__)

class Osu_Application
  def initialize(api_key)
    @url = "https://osu.ppy.sh"
    @key_conv = "?k=" + api_key
  end
  
  def osu_api(type, param="")
    case type
    when "/api/get_beatmaps"
    when "/api/get_user"
    when "/api/get_scores"
    when "/api/get_user_best"
    when "/api/get_user_recent"
    when "/api/get_match"
    else
      return false, "ERROR:not found type"
    end
    url =  @url + type + @key_conv + param
    response = open(url)
    return false, "ERROR:Failed to load URL. Please access this URL and check response." + url if response.status == '200'
    result = JSON.parse(response.read)
    return false, "ERROR:Failed to load URL. There is a possibility that the parameter is wrong. Please access this URL and check response." + url if result.size == 0
    return true, result
  rescue OpenURI::HTTPError
    return false, "ERROR:Failed to load URL(OpenURI::HTTPError) There is a possibility that the api_key is wrong. Please access this URL and check response." + url
  end
end
#osu_api = Osu_Application.new("77582c68fd989bf7d5e6465e579310f7ce274dee")
#p osu_api.osu_api("/api/get_beatmaps")

### status is Boolean, result is String ###
#status, result = osu_api("/api/get_beatmaps")
#status, result = osu_api("/api/get_user", "&u=flum_cat")
#status, result = osu_api("/api/get_scores", "&b=117236")
#status, result = osu_api("/api/get_user_best", "&u=flum_cat")
#status, result = osu_api("/api/get_user_recent", "&u=flum_cat")
#status, result = osu_api("/api/get_match", "&mp=16313057")
#p osu_api.osu_api("/api/get_beatmaps", "&m=3&a=1&since=2013-07-20")

=begin

##### RESPONSE AND PARAMETER EXAMPLE ######
  Official Documents => https://github.com/peppy/osu-api/wiki

  ### osu_api("/api/get_beatmaps") ###
    ### PARAM ###
      ・since
      ・s
      ・b
      ・u
      ・type
      ・m
      ・a
      ・limit
    ### RESPONSE ###
      [
              {
                  "beatmapset_id"=>"65536",
                  "beatmap_id"=>"191904",
                  "approved"=>"-2",
                  "approved_date"=>nil,
                  "last_update"=>"2012-11-16 11:37:16",
                  "total_length"=>"147",
                  "hit_length"=>"82",
                  "version"=>"Normal",
                  "artist"=>"Horizon",
                  "title"=>"Flare",
                  "creator"=>"Jade Harley",
                  "bpm"=>"144.035",
                  "source"=>"Homestuck",
                  "difficultyrating"=>"1.8058050870895386",
                  "diff_size"=>"2",
                  "diff_overall"=>"8",
                  "diff_approach"=>"5",
                  "diff_drain"=>"6",
                  "mode"=>"0"
              },
              {
                  "beatmapset_id"=>"131072",
                  "beatmap_id"=>"330225",
                  "approved"=>"-2",
                  "approved_date"=>nil,
                  "last_update"=>"2013-12-26 11:47:38",
                  "total_length"=>"0",
                  "hit_length"=>"0",
                  "version"=>"Hard",
                  "artist"=>"Fall Out Boy",
                  "title"=>"What's This?",
                  "creator"=>"Don_KillMe",
                  "bpm"=>"162.303",
                  "source"=>"Nightmare Before Christmas 3D Soundtrack",
                  "difficultyrating"=>"0",
                  "diff_size"=>"4",
                  "diff_overall"=>"7",
                  "diff_approach"=>"8",
                  "diff_drain"=>"7",
                  "mode"=>"0"
              },
              ...etc
          ]
  
  ### osu_api("/api/get_user", "&u=flum_cat") ###
    ### PARAM ###
      ・u
      ・m
      ・type
      ・event_days
  
    ### RESPONSE ###
      [
          {
              "user_id"=>"4108244",
              "username"=>"flum_cat",
              "count300"=>"1102572",
              "count100"=>"183552",
              "count50"=>"26071",
              "playcount"=>"9376",
              "ranked_score"=>"1211432563",
              "total_score"=>"3428645353",
              "pp_rank"=>"79581",
              "level"=>"80.3668",
              "pp_raw"=>"1039.29",
              "accuracy"=>"94.50547790527344",
              "count_rank_ss"=>"11",
              "count_rank_s"=>"147",
              "count_rank_a"=>"219",
              "country"=>"JP",
              "events"=>[
                  {
                      "display_html"=>"<img src='/images/A_small.png'/> <b><a href='/u/4108244'>flum_cat</a></b> achieved rank #546 on <a href='/b/465220?m=3'>xxdbxx - Taekwonburi [4K MX]</a> (osu!mania)",
                      "beatmap_id"=>"465220",
                      "beatmapset_id"=>"196171",
                      "date"=>"2015-05-23 21:53:33",
                      "epicfactor"=>"1"
                  }
              ]
          }
      ]
  
  ### osu_api("/api/get_scores", "&b=117236") ###
    ### PARAM ###
      ・b
      ・u
      ・m
      ・type
  
    ### RESPONSE ###
      [
          {
              "score"=>"16051568",
              "username"=>"DO96CH",
              "maxcombo"=>"928",
              "count50"=>"0",
              "count100"=>"3",
              "count300"=>"631",
              "countmiss"=>"0",
              "countkatu"=>"3",
              "countgeki"=>"109",
              "perfect"=>"1",
              "enabled_mods"=>"24",
              "user_id"=>"4258029",
              "date"=>"2015-01-21 17:09:05",
              "rank"=>"SH",
              "pp"=>"283.099"
          },
          {
              "score"=>"16043242",
              "username"=>"PeaChick",
              "maxcombo"=>"928",
              "count50"=>"0",
              "count100"=>"5",
              "count300"=>"629",
              "countmiss"=>"0",
              "countkatu"=>"5",
              "countgeki"=>"107",
              "perfect"=>"1",
              "enabled_mods"=>"24",
              "user_id"=>"213014",
              "date"=>"2013-02-11 17:34:50",
              "rank"=>"SH",
              "pp"=>"273.947"
          },
          ...etc
      ]
  ### osu_api("/api/get_user_best", "&u=flum_cat") ###
    ### PARAM ###
      ・u
      ・m
      ・limit
      ・type
  
    ### RESPONSE ###
      [
          {
              "beatmap_id"=>"117236",
              "score"=>"5358344",
              "maxcombo"=>"549",
              "count50"=>"4",
              "count100"=>"58",
              "count300"=>"567",
              "countmiss"=>"5",
              "countkatu"=>"19",
              "countgeki"=>"85",
              "perfect"=>"0",
              "enabled_mods"=>"0",
              "user_id"=>"4108244",
              "date"=>"2015-02-23 16:31:55",
              "rank"=>"B",
              "pp"=>"70.3658"
          },
          {
              "beatmap_id"=>"139139",
              "score"=>"3148868",
              "maxcombo"=>"472",
              "count50"=>"2",
              "count100"=>"33",
              "count300"=>"248",
              "countmiss"=>"0",
              "countkatu"=>"20",
              "countgeki"=>"41",
              "perfect"=>"0",
              "enabled_mods"=>"0",
              "user_id"=>"4108244",
              "date"=>"2015-02-21 17:15:34",
              "rank"=>"A",
              "pp"=>"62.5861"
          },
          ...etc
      ]
  
  ### osu_api("/api/get_user_recent", "&u=fulans") ###
    ### PARAM ###
      ・u
      ・m
      ・limit
      ・type
  
    ### RESPONSE ###
      [
          {
              "beatmap_id"=>"637537",
              "score"=>"647602",
              "maxcombo"=>"192",
              "count50"=>"0",
              "count100"=>"3",
              "count300"=>"135",
              "countmiss"=>"1",
              "countkatu"=>"2",
              "countgeki"=>"19",
              "perfect"=>"0",
              "enabled_mods"=>"0",
              "user_id"=>"4270336",
              "date"=>"2015-05-23 20:19:06",
              "rank"=>"F"
          },
          {
              "beatmap_id"=>"529108",
              "score"=>"20546950",
              "maxcombo"=>"1032",
              "count50"=>"0",
              "count100"=>"17",
              "count300"=>"643",
              "countmiss"=>"1",
              "countkatu"=>"15",
              "countgeki"=>"126",
              "perfect"=>"0",
              "enabled_mods"=>"0",
              "user_id"=>"4270336",
              "date"=>"2015-05-23 20:17:23",
              "rank"=>"F"
          },
      ]
  ### osu_api("/api/get_match", "&mp=1936471") ###
    ### PARAM ###
      ・mp
  
    ### RESPONSE ###
      {
           "match"=>{
               "match_id"=>"16313057",
               "name"=>"Nice Fridge's game",
               "start_time"=>"2015-05-23 22:21:24",
               "end_time"=>nil
           },
           "games"=>[
               {
                   "game_id"=>"104106019",
                   "start_time"=>"2015-05-23 22:24:50",
                   "end_time"=>"2015-05-23 22:26:13",
                   "beatmap_id"=>"154592",
                   "play_mode"=>"0",
                   "match_type"=>"0",
                   "scoring_type"=>"0",
                   "team_type"=>"0",
                   "mods"=>"0",
                   "scores"=>[
                       {
                           "slot"=>"0",
                           "team"=>"0",
                           "user_id"=>"3315604",
                           "score"=>"847430",
                           "maxcombo"=>"112",
                           "rank"=>"0",
                           "count50"=>"8",
                           "count100"=>"39",
                           "count300"=>"297",
                           "countmiss"=>"10",
                           "countgeki"=>"36",
                           "countkatu"=>"17",
                           "perfect"=>"0",
                           "pass"=>"1"
                       },
                       {
                           "slot"=>"1",
                           "team"=>"0",
                           "user_id"=>"2423725",
                           "score"=>"4472650",
                           "maxcombo"=>"460",
                           "rank"=>"0",
                           "count50"=>"1",
                           "count100"=>"40",
                           "count300"=>"312",
                           "countmiss"=>"1",
                           "countgeki"=>"46",
                           "countkatu"=>"20",
                           "perfect"=>"0",
                           "pass"=>"1"
                       },
                       ...etc
                   ]
               },
               {
                   "game_id"=>"104106323",
                   "start_time"=>"2015-05-23 22:27:39",
                   "end_time"=>"2015-05-23 22:29:34",
                   "beatmap_id"=>"146235",
                   "play_mode"=>"0",
                   "match_type"=>"0",
                   "scoring_type"=>"0",
                   "team_type"=>"0",
                   "mods"=>"0",
                   "scores"=>[
                       {
                           "slot"=>"0",
                           "team"=>"0",
                           "user_id"=>"3315604",
                           "score"=>"433780",
                           "maxcombo"=>"75",
                           "rank"=>"0",
                           "count50"=>"3",
                           "count100"=>"41",
                           "count300"=>"303",
                           "countmiss"=>"55",
                           "countgeki"=>"47",
                           "countkatu"=>"10",
                           "perfect"=>"0",
                           "pass"=>"0"
                       },
                       {
                           "slot"=>"1",
                           "team"=>"0",
                           "user_id"=>"2423725",
                           "score"=>"1134940",
                           "maxcombo"=>"155",
                           "rank"=>"0",
                           "count50"=>"14",
                           "count100"=>"35",
                           "count300"=>"337",
                           "countmiss"=>"15",
                           "countgeki"=>"61",
                           "countkatu"=>"12",
                           "perfect"=>"0",
                           "pass"=>"1"
                       },
                       ...etc
                   ]
               },
               ...etc
           ]
       }
##### Mods ######
  {
      None           = 0,
      NoFail         = 1,
      Easy           = 2,
      //NoVideo      = 4,
      Hidden         = 8,
      HardRock       = 16,
      SuddenDeath    = 32,
      DoubleTime     = 64,
      Relax          = 128,
      HalfTime       = 256,
      Nightcore      = 512, // Only set along with DoubleTime. i.e: NC only gives 576
      Flashlight     = 1024,
      Autoplay       = 2048,
      SpunOut        = 4096,
      Relax2         = 8192,  // Autopilot?
      Perfect        = 16384,
      Key4           = 32768,
      Key5           = 65536,
      Key6           = 131072,
      Key7           = 262144,
      Key8           = 524288,
      keyMod         = Key4 | Key5 | Key6 | Key7 | Key8,
      FadeIn         = 1048576,
      Random         = 2097152,
      LastMod        = 4194304,
      FreeModAllowed = NoFail | Easy | Hidden | HardRock | SuddenDeath | Flashlight | FadeIn | Relax | Relax2 | SpunOut | keyMod,
      Key9           = 16777216,
      Key10          = 33554432,
      Key1           = 67108864,
      Key3           = 134217728,
      Key2           = 268435456
  }

=end