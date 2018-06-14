# thingQbot
Autonomous robot for room mapping.

## Prerequisites
1. It is advised that you have working knowledge of ROS (Robot Operating Systems).
2.

## Setup
#### Setting up the Nvidia Jetson TX2
In order to set up a brand new Nvidia Jetson TX2, use the NVIDIA Jetpack SDK to install the required OS image and tools. Follow the links below for more informations:
1. [NVIDIA Jetson develpoer kit User Guide](https://developer.nvidia.com/embedded/dlc/l4t-28-2-jetson-developer-kit-user-guide). This link might require NVIDIA Developer Program access.
2. [NVIDIA Jetpack 3.2.1 Introduction](https://docs.nvidia.com/jetpack-l4t/index.html#jetpack/3.2.1/introduction.htm). This also containes the list of libraries and tools included in the bundle.
3. [NVIDIA Jetpack 3.2.1 Installation Guide](https://docs.nvidia.com/jetpack-l4t/index.html#developertools/mobile/jetpack/l4t/3.2/install.htm)

#### Installing ZED SDK on Jetson TX2
Download and install the [ZED SDK](https://www.stereolabs.com/developers/release/2.4/) for your device. The downloaded file is basically a script. 
Run `chmod +x {Name of the Downloaded Script}`\
Next, run `./{Name of the Downloaded Script}`\
E.g: `chmod +x ZED_SDK_Linux_JTX2_JP3.2_v2.4.0.run`
     `./ZED_SDK_Linux_JTX2_JP3.2_v2.4.0.run` \
Once installed, plug in the ZED Camera and run the sample apps or diagnostics to check if your camera is working properly.

Note: The ZED Camera requires a high bandwidth and works only on USB 3.0 . If you are using a hub with your Jetson TX2, you might want to use a powered one if you plan to connect the camera through the hub.
#### Installing ROS on Jetson TX2 and required dependencies
1. Installing ROS on TX2 is very straight forward. Follow this [link](http://wiki.ros.org/kinetic/Installation/Ubuntu) for installing ROS Kinetic. Or follow this [link](http://wiki.ros.org/ROS/Installation) for other distributions.
2. After installing ROS, there are some [Network Setup](http://wiki.ros.org/ROS/NetworkSetup) configurations that need to be done.
3. Once ROS is installed, we will install the `zed-ros-wrapper` which as the name suggests, is a ROS wrapper for the ZED SDK. This allows us to seamlessly use the ZED camera with ROS. Follow this [link](https://docs.stereolabs.com/integrations/ros/getting-started/) for installing the wrapper. 

Note: 
1. If you want to use the code given in this repo, you need not download the `zed-ros-wrapper` separately. The modified wrapper is included in this repo. 
2. Make sure that you run command `source /opt/ros/kinetic/setup.bash` before using ROS. (The ROS setup path. This is the default path if you install through apt-get)
3. It is advisable to add the above command to `.bashrc` for convenience.

#### Miscellaneous Configurations on Jetson TX2
##### Setting up a VNC Server on TX2
Follow this [link](http://ubuntuhandbook.org/index.php/2016/07/remote-access-ubuntu-16-04/) to set up options on TX2. You can now use VNC client, TigerVNC etc. to connect to the TX2 remotely.

Note: You need to be on the same network.
#### Installing libraries
---
##### ROS packages that will be used
1. [**gmapping**](http://wiki.ros.org/gmapping)
2. [**depthimage_to_laserscan**](http://wiki.ros.org/depthimage_to_laserscan)
3. [zed-ros-wrapper](http://wiki.ros.org/zed-ros-wrapper) (included in this repo)
4. [frontier-exploration](http://wiki.ros.org/frontier_exploration) (not used in the demo but included in this repo. Can modify to use this package instead)
5. [explore_lite](http://wiki.ros.org/explore_lite) (included in this repo)
6. [turtlebot_navigation](http://wiki.ros.org/turtlebot_navigation) (included in this repo)

You will need to install the packages that are not included. Run the following commands to install through `apt-get`:\
`sudo apt-get install ros-kinetic-gmapping`\
`sudo apt-get install ros-kinetic-depthimage_to_laserscan`\
Note:
1. You can also install them as catkin packages. See [catkin workspaces](http://wiki.ros.org/catkin/workspaces#Building_Packages_with_catkin)
2. The above commands are for ROS kinetic. Modify them according to your distribution.

All the ROS packages in this repo have to be installed through catkin. First, set up a catkin workspace. \
Run command `mkdir -p ~/catkin_ws/src`\
Next run `cd ~/catkin_ws`\
Finally, run `catkin_make`\
Before continuing, source your new setup.\*sh file.\
`source devel/setup.bash`\
(You can also add the command `source ~/catkin_ws/devel/setup.bash` to `~/.bashrc`)


Note: catkin is installed by default when installing ROS. If not then follow this [link](http://wiki.ros.org/catkin#Installing_catkin). More information regarding creating catkin workspaces can be found [here](http://wiki.ros.org/catkin/Tutorials/create_a_workspace).

Next clone this repository.\
`cd ~`\
`git clone {Link of this repository}`
Now copy all folders except the images folder to `~/catkin_ws/src`\
Next, run `cd ~/catkin_ws` followed by `catkin_make`
The ROS packages will now be installed.


Note:\
Make sure that `~/catkin_ws/devel/setup.bash` is sourced before running the bot.
#### Running the bot
Once everything is set up, follow the steps below:
1. Open terminal on the TX2, and run `roslaunch zed_wrapper zed.launch`\
This ROS launch files typically launches the ZED camera. However, if you download the package from this repo, this file has been modified to bringup kobuki, launch the camera, convert depth image data to laserscan and launch gmapping.
2. Next, in a different tab, run `roslaunch turtlebot_navigation move_base_standalone.launch`\
This brings up the navigation stack.
3. Finally, on a third tab run `roslaunch explore_lite explore_tqb.launch`\
This launches the frontier exploration node and the bot will start moving and explore the area automatically.


Note:
1. You can view the exploration and the maps generated through `rviz`. Run `rosrun rviz rviz` in a new tab to open rviz. You need to add the required elements to view them on rviz. 
2. You can run the above commands on the TX2 itself either through desktop sharing or SSH. `rviz` however will not work on SSH because it is GUI based.
3. You can also run these commands through a remote PC. Follow this [link](http://wiki.ros.org/turtlebot/Tutorials/indigo/Network%20Configuration) for more info. The tutorial in for ROS Indigo but works for later versions as well.
4. More info on ROS [launch files](http://wiki.ros.org/roslaunch)




