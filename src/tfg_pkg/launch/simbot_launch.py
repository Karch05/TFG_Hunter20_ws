import os

from launch import LaunchDescription
from launch.actions import IncludeLaunchDescription, OpaqueFunction, GroupAction
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.actions import DeclareLaunchArgument, SetEnvironmentVariable
from launch.substitutions import LaunchConfiguration
from launch_ros.actions import Node, PushRosNamespace
from launch_ros.parameter_descriptions import ParameterFile
from nav2_common.launch import RewrittenYaml
from ament_index_python.packages import get_package_share_directory
import xacro

def launch_setup(context, *args, **kwargs):
    # Get the launch directory
    pkg_dir = get_package_share_directory("tfg_pkg")
    

    # variables/files
    use_sim_time = False
    remappings = []
    params_yaml_file = ParameterFile( os.path.join(pkg_dir, 'launch', 'simbot_params.yaml'), allow_substs=True)
    nav2_launch_file = os.path.join(pkg_dir, 'launch', 'nav2_hunter_launch.py')
    rviz_file = os.path.join(pkg_dir, 'rviz', 'hunter_robot.rviz')
    urdf = os.path.join(pkg_dir, 'launch', 'hunter2_urdf.xml')
    namespace = LaunchConfiguration('namespace').perform(context)

    
    # RVIZ2
    #============
    rviz=[
        Node(
            package='rviz2',
            executable='rviz2',
            name='rviz2',
            output='screen',
            arguments=['-d' + rviz_file],
            remappings=[
                ("/initialpose", "/initialpose"),
                ("/goal_pose", "/goal_pose")
            ]    
        ),
    ]


# URDF model (TFs)
    robot_desc = xacro.process_file(os.path.join(pkg_dir, 'urdf', 'hunter2.xacro'), mappings={'frame_ns': namespace})
    robot_desc = robot_desc.toprettyxml(indent='  ')
    robot_state_publisher = [
        Node(
            package='robot_state_publisher',
            executable='robot_state_publisher',
            name='robot_state_publisher',
            output='screen',
            parameters=[{'robot_description': robot_desc}],
            arguments=[urdf],
            ),
    ]

    
    # SET what to launch
    actions=[PushRosNamespace(namespace)]
    actions.extend(rviz)
    actions.extend(robot_state_publisher)
    return[
        GroupAction
        (
            actions=actions
        )
    ]


def generate_launch_description():

    return LaunchDescription([
        # Set env var to print messages to stdout immediately
        SetEnvironmentVariable('RCUTILS_LOGGING_BUFFERED_STREAM', '1'),

        DeclareLaunchArgument(
            "log_level",
            default_value=["info"],  #debug, info
            description="Logging level",
            ),

        DeclareLaunchArgument('namespace', default_value="hunter20"),
        OpaqueFunction(function = launch_setup)
    ])
