#include <../../home/karch/ws/TFG_Hunter20_ws/src/tfg_pkg/include/tfg_pkg/actuator.hpp>

using std::placeholders::_1;

Actuator::Actuator(): Node ("actuator")
{
    pub_ = this->create_publisher<geometry_msgs::msg::Twist> ( "/action",10);

    sub_ = this->create_subscription<geometry_msgs::msg::Twist>("/cmd_vel", 10, std::bind(&Actuator::execute_command, this, _1) );

};

Actuator::~Actuator()
{

}

void Actuator::execute_command(const geometry_msgs::msg::Twist::SharedPtr msg) const
    {
        geometry_msgs::msg::Twist actuation;
        float linear, angular;
        linear = msg->linear.x;
        angular = msg->angular.z;

        if (linear < 0 ) {angular=-angular;}

        if ( linear > -0.051 && linear < -0.049 && angular == 0) {angular = 0.2;}
	 
        actuation.linear.x = linear;
        actuation.angular.z = angular;
        
        pub_->publish(actuation);

        printf("Velocidad Lineal: %f y Velocidad Angular: %f \n", linear, angular);
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
