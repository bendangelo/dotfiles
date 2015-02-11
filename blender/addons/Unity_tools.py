import bpy

bl_info = {
 "name": "Unity Tools",
 "author": "Karol \"Mirgar\" Głażewski",
 "version": (1, 0, 2),
 "blender": (2, 6, 5),
 "location": "3D View > Tool Shelf > Unity Tools",
 "description": "Tools to ease workflow with Unity Engine",
 "warning": "",
 "wiki_url": "",
 "tracker_url": "",
 "category": "Object"}

# fixes rotation on X axis, +X is -X in Unity compared to Blender
class UnityRotationFixerX(bpy.types.Operator):
    
    bl_description = "Fixes rotation of object so it will not \"lay on its face\" in Unity, +X axis is -X compared to Unity"
    bl_label = "Simple rotation fix"
    bl_idname = "object.unity_rotation_fix_x"
    bl_options = {'REGISTER', 'UNDO'}
    
    
    def FixRotationForUnity3D(self):
        bpy.ops.object.transform_apply(rotation = True)
        bpy.ops.transform.rotate(value = -1.5708, axis = (1, 0, 0), constraint_axis = (True, False, False), constraint_orientation = 'GLOBAL')
        
        bpy.ops.object.transform_apply(rotation = True)
        bpy.ops.transform.rotate(value = 1.5708, axis = (1, 0, 0), constraint_axis = (True, False, False), constraint_orientation = 'GLOBAL')
    
    @classmethod
    def poll(cls, context):
        return context.mode == 'OBJECT' and context.area.type == 'VIEW_3D'
		
    def execute(self, context):
        self.FixRotationForUnity3D()
        return {'FINISHED'}
        
# fixes rotation on X and Z axis, front is now +Y
class UnityRotationFixerXZ(bpy.types.Operator):
    
    bl_description = "Fixes rotation of object, +Y is now front"
    bl_label = "Full rotation fix"
    bl_idname = "object.unity_rotation_fix_xz"
    bl_options = {'REGISTER', 'UNDO'}

    def FixRotationForUnity3D(self):
        bpy.ops.object.transform_apply(rotation = True)

        bpy.ops.transform.rotate(value = -1.5708, axis = (1, 0, 0), constraint_axis = (True, False, False), constraint_orientation = 'GLOBAL')
        bpy.ops.transform.rotate(value = -3.1416, axis = (0, 1, 0), constraint_axis = (False, True, False), constraint_orientation = 'GLOBAL')

        bpy.ops.object.transform_apply(rotation = True)

        bpy.ops.transform.rotate(value = 1.5708, axis = (1, 0, 0), constraint_axis = (True, False, False), constraint_orientation = 'GLOBAL')
        bpy.ops.transform.rotate(value = 3.1416, axis = (0, 0, 1), constraint_axis = (False, False, True), constraint_orientation = 'GLOBAL')
    @classmethod
    def poll(cls, context):
        return context.mode == 'OBJECT' and context.area.type == 'VIEW_3D'
    
    def execute(self, context):
        self.FixRotationForUnity3D()
        return {'FINISHED'}
    
class UnityPanel(bpy.types.Panel):
    
    bl_idname = "OBJECT_PT_unity_tools"
    bl_label = "Unity Tools"
    bl_space_type = 'VIEW_3D'
    bl_region_type = 'TOOLS'
    bl_context = "objectmode"
    bl_options = {'DEFAULT_CLOSED'}
    
    def draw(self, context):
        
        layout = self.layout
        
        col = layout.column(align=True)
        col.label(text="Rotation:")
        col.operator("object.unity_rotation_fix_x")
        col.operator("object.unity_rotation_fix_xz")
        
    
#registers    
    
def register():
    bpy.utils.register_class(UnityRotationFixerX)
    bpy.utils.register_class(UnityRotationFixerXZ)
    bpy.utils.register_class(UnityPanel)

def unregister():
    bpy.utils.unregister_class(UnityRotationFixerX)
    bpy.utils.unregister_class(UnityRotationFixerXZ)
    bpy.utils.unregister_class(UnityPanel)

if __name__ == "__main__":
    register()
