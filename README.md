osu_collection_picker
===========

##What is it?

osu!のデータベースからコレクションのデータを取り出し、別フォルダにコピーするプログラムです。  
メインPCからノートパソコン等にデータを移す際にコレクションのデータのみ移行できるので容量を削減できます。  

動作確認はruby 2.0.0p481及びruby 2.1.0ですがruby 1.9.3でも動くと思います。

##How to Use
まず[osu!Collections Editor](https://osu.ppy.sh/forum/t/131103)を使用してコレクションデータをbeatmaps.txtとして出力してください。  
準備としてpicker.rbと同じフォルダにbeatmaps.txtを保存してください。  
osuのapi_keyを[osu! API Access](https://osu.ppy.sh/p/api)から取得してください。  
osuのSongsフォルダ及びapi_keyをpicker.rbのapi_key及びpathに指定してください。  

```
ruby picker.rb
``` 
で起動してください。  

実行後osu_collection_picker/beatmaps/にデータが保存されます。  


質問等ありましたらTwitter:[@flum_](https://twitter.com/flum_)までお願いします。  

##License

The MIT License

-------
(c) @2015 flum_