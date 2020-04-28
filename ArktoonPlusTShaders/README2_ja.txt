Arktoon+T-Shaders は Arktoon-Shaders に下記の機能を追加した物です。

----
v1.0.0.0
----
* 全般
    * UV Transform (with Cropping)
    * Emission Mask (in Alpha Channel)
    * Emission 2
    * Light Color Saturation
    * Gloss Color Texture
    * Reflection Color Texture
* _Extra/EmissiveWaves
    * Trace 
    * Blink
    * Tint
----
v1.0.0.1
----
* バグ修正
    * UV Scroll の範囲にテクスチャの縁が含まれる場合に比較が正しく行われない問題を修正。
    * Trace のノイズを低減。
----
v1.0.1.0
----
* 仕様変更
    * Blink Wave Type の None の項目が冗長なのでオミット。これにより Wave Type 及び Wave Type Map はこれ以前のバージョンと値が変化するので注意。
----
v1.1.0.0
----
* 機能追加
    * Gloss の Metallic パラメータにマスクを実装。
    * Lighting というパラメータのグループを追加。
    * Light Color Saturation のパラメータを Common から Lighting のグループに移動。
* 仕様変更
    * Light Color Saturation のパラメータ範囲と計算方法を変更。
* バグ修正
    * Gloss Color Texture と Reflection Color Texture の Tiling と Offset のパラメータが抜けていたので追加。
    * Light Color Saturation のマスクが上手く動いていなかったので修正。
----

また、改変部に関してもライセンスは MIT License を適用します。
機能追加部分の詳細については https://github.com/TokageItLab/ArktoonPlusT-Shaders を参照して下さい。
