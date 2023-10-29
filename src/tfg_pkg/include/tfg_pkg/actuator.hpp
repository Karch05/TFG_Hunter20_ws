#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/string.hpp"
#include "geometry_msgs/msg/twist.hpp"
#include <string>

class Actuator : public rclcpp::Node
{
public:
        Actuator();

        void execute_command(const geometry_msgs::msg::Twist::SharedPtr msg) const;

        ~Actuator();

private:
    rclcpp::Publisher<geometry_msgs::msg::Twist>::SharedPtr pub_;

    rclcpp::Subscription<geometry_msgs::msg::Twist>::SharedPtr sub_;

    size_t count_;
};
