#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/string.hpp"
#include "geometry_msgs/msg/twist.hpp"
#include "nav_msgs/msg/odometry.hpp"
#include <string>

class Actuator : public rclcpp::Node
{
public:
        Actuator();

        void execute_command(const nav_msgs::msg::Odometry::SharedPtr msg) ;

        ~Actuator();

private:
    rclcpp::Publisher<geometry_msgs::msg::Twist>::SharedPtr pub_;

    rclcpp::Subscription<nav_msgs::msg::Odometry>::SharedPtr sub_;

    size_t count_;

    geometry_msgs::msg::Twist next_move_;
};
