package npm;

import npm.jsyaml.*;

#if norequire @:native('jsyaml')
#else @:jsRequire('js-yaml') #end
extern class JSYaml {
  public function safeLoad(input : String, ?options : LoadOptions) : {};
  public function load(input : String, ?options : LoadOptions) : {};
  public function safeLoadAll(input : String, iterator : String -> Void, ?options : LoadOptions) : {};
  public function loadAll(input : String, iterator : String -> Void, ?options : LoadOptions) : {};
  public function safeDump(input : {}, ?options : DumpOptions) : String;
  public function dump(input : {}, ?options : DumpOptions) : String;
}
