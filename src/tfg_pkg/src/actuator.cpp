#include <../../home/karch/ws/TFG_Hunter20_ws/src/tfg_pkg/include/tfg_pkg/actuator.hpp>

using std::placeholders::_1;

Actuator::Actuator(): Node ("actuator")
{
    pub_ = this->create_publisher<geometry_msgs::msg::Twist> ( "/cmd_vel",10);

    sub_ = this->create_subscription<nav_msgs::msg::Odometry>("Hunter20/odom", 10, std::bind(&Actuator::execute_command, this, _1) );

};

Actuator::~Actuator()
{

}

void Actuator::execute_command(const nav_msgs::msg::Odometry::SharedPtr msg) 
    {
        count_ += 1;
        if (count_ > 0 && count_< 375)
            {
                next_move_.linear.x = 0.2;
                next_move_.angular.z = 0.3;
                pub_->publish(next_move_);
                printf("contador de aparcamiento: %li. \n", count_);
            }
            else if (count_ > 375 && count_ < 400)
            {
                next_move_.linear.x = 0.2;
                next_move_.angular.z = 0;
                pub_->publish(next_move_);
                printf("contador de aparcamiento: %li. \n", count_);
            }
            else if (count_ > 400 && count_ < 800)
            {
                next_move_.linear.x = 0.2;
                next_move_.angular.z = 0.3;
                pub_->publish(next_move_);
                printf("contador de aparcamiento: %li. \n", count_);
            }
            else if (count_ > 800 && count_ < 900)
            {
                next_move_.linear.x = 0.2;
                next_move_.angular.z = 0;
                pub_->publish(next_move_);
                printf("contador de aparcamiento: %li. \n", count_);
            }
            else if (count_ > 900 && count_ < 1100)
            {
                next_move_.linear.x = -0.2;
                next_move_.angular.z = 0;
                pub_->publish(next_move_);
                printf("contador de aparcamiento: %li. \n", count_);
            }
            else
            {
            next_move_.linear.x = 0;
                next_move_.angular.z = 0;
                pub_->publish(next_move_); 
            }
    }

int main ( int argc, char * argv[] )
{
    rclcpp::init ( argc, argv );

    auto node=std::make_shared<Actuator>();

    rclcpp::Rate loop_rate(100);


    while (rclcpp::ok()) {
        //Atendemos a los topics subscritos y modificamos velocidades
        rclcpp::spin_some(node);
        //publicamos Twist al robot (idealmente con un método de la clase)
        // mantenemos rate
        loop_rate.sleep();
    }


    rclcpp::shutdown();

    return 0;
}
