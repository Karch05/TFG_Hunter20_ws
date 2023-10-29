import os

from launch import LaunchDescription
from launch.actions import OpaqueFunction, GroupAction
from launch.actions import DeclareLaunchArgument, SetEnvironmentVariable
from launch.substitutions import LaunchConfiguration
from launch_ros.parameter_descriptions import ParameterFile
from launch_ros.actions import Node, PushRosNamespace
from ament_index_python.packages import get_package_share_directory

def launch_setup(context, *args, **kwargs):
    # Get the launch directory
    pkg_dir = get_package_share_directory("tfg_pkg")
    params_yaml_file = ParameterFile( os.path.join(pkg_dir, 'launch', 'hunter_params.yaml'), allow_substs=True)
    namespace = LaunchConfiguration('namespace').perform(context)
    
    # HW_DRIVERS
    #===========    
    driver_nodes =[
        
        # Hokuyo UTM-30LX
        Node(
            package='urg_node',
            executable='urg_node_driver',
            name='hokuyo',
            output='screen',
            parameters=[params_yaml_file]
            ),
    ]


    actions=[PushRosNamespace(namespace)]
    actions.extend(driver_nodes)
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
        DeclareLaunchArgument('namespace', default_value="hunter"),
        OpaqueFunction(function = launch_setup)
    ])
