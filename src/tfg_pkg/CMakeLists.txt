cmake_minimum_required(VERSION 3.8)
project(tfg_pkg)

# Default to C++14
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(rosidl_default_generators REQUIRED)
find_package(std_msgs REQUIRED)
find_package(geometry_msgs REQUIRED)
find_package(diagnostic_msgs REQUIRED)
find_package(sensor_msgs REQUIRED)
find_package(nav_msgs REQUIRED)
# uncomment the following section in order to fill in
# further dependencies manually.
# find_package(<dependency> REQUIRED)

# Add Executables
add_executable(coppelia_simulator src/run_coppelia_simulator.cpp)
add_executable(keyboard_control_plus src/keyboard_control_plus.cpp)
add_executable(actuator src/actuator.cpp)

ament_target_dependencies(coppelia_simulator rclcpp)
ament_target_dependencies(keyboard_control_plus rclcpp std_msgs geometry_msgs)
ament_target_dependencies(actuator rclcpp std_msgs geometry_msgs nav_msgs)

# Declare and install executables
install(TARGETS
  coppelia_simulator
  keyboard_control_plus
  actuator
  DESTINATION lib/${PROJECT_NAME}
)


# Install launch files.
install(DIRECTORY
  launch
  scenes
  maps
  rviz
  meshes
  urdf
  DESTINATION share/${PROJECT_NAME}/
)

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  # the following line skips the linter which checks for copyrights
  # comment the line when a copyright and license is added to all source files
  set(ament_cmake_copyright_FOUND TRUE)
  # the following line skips cpplint (only works in a git repo)
  # comment the line when this package is in a git repo and when
  # a copyright and license is added to all source files
  set(ament_cmake_cpplint_FOUND TRUE)
  ament_lint_auto_find_test_dependencies()
endif()

ament_package()
