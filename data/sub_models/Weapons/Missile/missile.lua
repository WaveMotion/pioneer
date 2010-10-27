define_model('missile', {
	info = {
		bounding_radius = 4,
		materials={ 'body' },
		tags = { 'ship' },
		ship_defs = {
			{
				'MISSILE_UNGUIDED',
				{ 0, -4*10^5, 0, 0, 0, 0 },
				0,
				{},
				{ 0, 0, 1, 0 },
				0, 1, 100
			}, {
				'MISSILE_GUIDED', 
				{ 1*10^5, -2*10^5, 0, 0, 0, 0 },
				2*10^4,
				{},
				{ 0, 0, 1, 0 },
				0, 1, 100
			}, {
				'MISSILE_SMART', 
				{ 1.5*10^5, -3*10^5, 0, 0, 0, 0 },
				2*10^4,
				{},
				{ 0, 0, 1, 0 },
				0, 1, 100
			}, {
				'MISSILE_NAVAL', 
				{ 2.0*10^5, -4*10^5, 0, 0, 0, 0 },
				2*10^4,
				{},
				{ 0, 0, 1, 0 },
				0, 1, 100
			}
		},
	},
	static = function(lod)
		set_material('body', 1,1,1,1)
		use_material('body')
		cylinder(8, v(0,0,1), v(0,0,-3), v(0,1,0), .25)
		thruster(v(0,0,1), v(0,0,1), 10, true)
	end
})

define_model('missile_1', {     
   	info = {
			scale = 1,
			lod_pixels={10,200,400,0},
			bounding_radius = 5,
			materials={'casing', 'tip', 'glow1', 'ran1', 'ran2'},
					tags = { 'ship' },
		ship_defs = {
			{
				'MISSILE_UNGUIDED',
				{ 0, -4*10^5, 0, 0, 0, 0 },
				0,
				{},
				{ 0, 0, 1, 0 },
				0, 1, 100
			}, {
				'MISSILE_GUIDED', 
				{ 1*10^5, -2*10^5, 0, 0, 0, 0 },
				2*10^4,
				{},
				{ 0, 0, 1, 0 },
				0, 1, 100
			}, {
				'MISSILE_SMART', 
				{ 1.5*10^5, -3*10^5, 0, 0, 0, 0 },
				2*10^4,
				{},
				{ 0, 0, 1, 0 },
				0, 1, 100
			}, {
				'MISSILE_NAVAL', 
				{ 2.0*10^5, -4*10^5, 0, 0, 0, 0 },
				2*10^4,
				{},
				{ 0, 0, 1, 0 },
				0, 1, 100
			}
		},
        },

   	static = function(lod)
   	
		if lod > 2 then
   	
			set_material('casing', .49,.54,.54,1,.95,.98,1,10)
			set_material('tip', .4,.4,.42,1,.65,.68,.72,210)
		
			use_material('casing')
			load_obj('missile_casing.obj')
			use_material('tip')
			load_obj('missile_tip.obj')
			use_material('ran1')
			load_obj('missile_stripe.obj')
			use_material('ran2')
			load_obj('missile_fins.obj')
			use_material('glow1')
			load_obj('missile_glow.obj')
	
		else
		
			call_model('missile', v(0,0,0), v(1,0,0), v(0,1,0), 1)
			
		end
		
		
	end,
	
	
	dynamic = function(lod)	
	
	
		if lod > 2 then
	
	
			set_material('ran1', get_arg_material(0))
			set_material('ran2', get_arg_material(1))
			set_material('glow1', lerp_materials(os.clock()*0.2,	{0, 0, 0, 1, 0, 0, 0, 0, 0.8, 0.8, 0.3 },
															{0, 0, 0, 1, 0, 0, 0, 0, .4, .2, 0 }))
															
		end												
																														
	end
})