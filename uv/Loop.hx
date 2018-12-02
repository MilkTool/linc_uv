package uv;

import uv.Uv;
import cpp.*;

@:dce
@:build(uv.Data.inject())
abstract Loop(Pointer<Loop_t>) from Pointer<Loop_t> to Pointer<Loop_t> {
	public static var DEFAULT(get, null):Loop;
	static inline function get_DEFAULT() return Pointer.fromRaw(Uv.default_loop());
	
	public inline function new() this = Stdlib.malloc(Stdlib.sizeof(Loop_t));
	public inline function init() return Uv.loop_init(asRaw());
	public inline function destroy() return Stdlib.free(this);
	@:to public inline function asRaw():RawPointer<Loop_t> return this.raw;
	@:to public inline function asHandle():Handle return (this.reinterpret():Pointer<Handle_t>);
	
	public inline function run(mode) return Uv.run(asRaw(), mode);
}