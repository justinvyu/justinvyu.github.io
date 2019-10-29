---
layout: post
title: Botball Libraries
---

<div class="message">
I published a paper to the 2016 Global Conference on Educational Robotics, which you can find
<a href="{{ site.baseurl }}/public/documents/gcerpaper-2016.pdf">here</a>.
</div>

This is an introduction to using our all-new, object-oriented Botball libraries. For many teams, the programming phase of this season has begun, and I wanted to share this new, more intuitive style of programming I've been developing.

You can find all the source code mentioned in this post [here](https://github.com/justinvyu/botball/tree/master/classes).

---

## The Problem

Since KIPR's platform does not support object-oriented programming (OOP) languages like C++ or Python, we've been using commands like:

```c
create_connect();
camera_open();
motor(MOTOR_LEFT, 80);
create_disconnect();
```

Fair enough. I can live with it. After all, we are using C and programming for robotics. However, there's one thing that's been bugging me ever since I started using the LACT libraries: **every year, I need to make a new copy of the libraries and modify them so that they fit my robot's specs.**

And here is where OOP comes in.

## Object-Oriented Botball

Here's what Steve Jobs said regarding OOP:

>Objects are like people. They’re living, breathing things that have knowledge inside them about how to do things and have memory inside them so they can remember things. And rather than interacting with them at a very low level, you interact with them at a very high level of abstraction, like we’re doing right here.
>
>Here’s an example: If I’m your laundry object, you can give me your dirty clothes and send me a message that says, “Can you get my clothes laundered, please.” I happen to know where the best laundry place in San Francisco is. And I speak English, and I have dollars in my pockets. So I go out and hail a taxicab and tell the driver to take me to this place in San Francisco. I go get your clothes laundered, I jump back in the cab, I get back here. I give you your clean clothes and say, “Here are your clean clothes.”
>
>You have no idea how I did that. You have no knowledge of the laundry place. Maybe you speak French, and you can’t even hail a taxi. You can’t pay for one, you don’t have dollars in your pocket. Yet I knew how to do all of that. And you didn’t have to know any of it. All that complexity was hidden inside of me, and we were able to interact at a very high level of abstraction. **That’s what objects are. They encapsulate complexity, and the interfaces to that complexity are high level.**

And this is exactly the solution to our problem. Why mess around with the drive.h or createDrive.h source code when you can just pass values into a generic *constructor* that handles everything for you? This is the premise I've based these new libraries on, and I've also tried to keep things consistent with other OOP languages.

## The Libraries

There are two main "classes" in the new libraries: the Create class and the Controller class. I've also recently added a Camera class that my team has been using.

As you'd expect, the Create class refers to the iRobot and the Controller class refers to the Wallaby controller. And the Camera class refers to the camera provided by KIPR.

Note: I've ported (and modified) most of the old LACT functions from drive.h and createDrive.h.

### The Create Class
[Create.h](https://raw.githubusercontent.com/justinvyu/botball/master/classes/Create.h)  (header file)
[Create.c](https://raw.githubusercontent.com/justinvyu/botball/master/classes/Create.c)  (implementation file)

Here is a snippet that *instantiates* a Create object -- with the variable name my_create -- and invokes a few method calls:

```c
Create my_create = new_create();

my_create.connect();
my_create.forward(10, 300); // (distance, speed)
my_create.left(90, 10, 250); // (angle, radius, speed)
my_create.disconnect();
```

A few things to note:

- The `new_create()` function is the global constructor for the Create class. It returns a newly created instance of the Create class.
- `my_create` is the name of the new instance. You use this variable to name to reference the newly created object and call functions such as `forward(10, 300)`, `left(90, 10, 250)`, `disconnect()`, etc.
- Normally, you would use something like `create_connect()`, but now we use the object to reference the `connect` method: `my_create.connect()`.

### The Controller Class
[Controller.h](https://raw.githubusercontent.com/justinvyu/botball/master/classes/Controller.h)  (header file)
[Controller.c](https://raw.githubusercontent.com/justinvyu/botball/master/classes/Controller.c)  (implementation file)

Here is a snippet that *instantiates* a Controller object -- with the variable name wallaby -- and invokes a few method calls:

```c
// Controller constructor: 
// (left_motor, right_motor, 
// distance_between_wheels, wheel_diameter)
Controller wallaby = new_controller(0, 1, 14.5, 5.0);

wallaby.forward(10, 80); // (distance, speed)
wallaby.right(90, 0, 90); // (angle, radius, speed)
wallaby.motor(wallaby.motor_left, 90);
wallaby.servo(0, 2047);

msleep(1000);
```

A few things to note:

- Here, we can see how object-oriented programming makes it a lot easier to reuse the libraries. The constructor takes in four values that are needed to go forward/turn properly: the left motor port, the right motor port, the distance between the wheels, and the diameter of the wheel.
- The `forward` and `right` functions now have a speed parameter.
- You can access instance variables from the `wallaby` object. For example, you can get the robot's left motor port by using `wallaby.motor_left`.
- Functions like `msleep` remain the same.
- I've renamed `set_servo_position` to stay consistent with the `motor` command. Plus it's shorter.

### (Alternate) Controller Class

There is an alternate constructor for creating a Controller object when you have a controller connected to a Create. In this case, there is no need to pass anything into the constructor because there isn't a left/right wheel for driving.

```c
Controller wallaby = new_create_controller();

// ...
```

### The Camera Class
[Camera.h](https://raw.githubusercontent.com/justinvyu/botball/master/classes/Camera.h)  (header file)
[Camera.c](https://raw.githubusercontent.com/justinvyu/botball/master/classes/Camera.c)  (implementation file)

Here is a snippet that *instantiates* a Camera object -- with the variable name camera -- and invokes a few method calls:

```c
Camera camera = new_camera();

camera.open();
camera.update();

printf("%d", camera.get_object_count(0, 0)); // (channel, blob #)
camera.close();
```

All of the camera functions are as defined by KIPR, just modified for OOP style.

---

## "Subclassing"

Now we're moving into the more technical part of this post. While it's okay to just use three objects (a Create object, a Controller object, and a Camera object) and manage them separately in your code, there's a better way to add yet another layer of abstraction: "subclassing."

I put this in quotes because I'm not actually subclassing -- I'm just encapsulating the three objects into another object.

When you refer to your robot, you refer to it as a single unit. For example, let's say your robot's name is Bob. You wouldn't refer to your robot as a Create, a controller, and a camera. You would just refer to your robot as Bob. Bob is who/what you are interfacing with, and inside the object Bob, there is also a create object, a controller object, and a camera object that *Bob* can interface with. 

Here's an example will clear this up:

```c
MyClass bob = new_robot(...); // your motor ports/robot specs go here

bob.create.connect();
bob.camera.open();
bob.controller.servo(0, 2047);

bob.camera.close();
bob.create.disconnect();
```

A few things to note:

- `MyClass` is the new class you define for your **entire** robot. In the `bob` instance, there is a create object, a camera object, and a controller object that you can reference. (Of course, can customize what objects your class contains according to your what your actual robot needs.)
- You can call all the create functions as described above through bob. For example, to connect: `bob.create.connect()`. The same applies for the camera and the controller.

## Subclassing Quickstart

This will just be a very brief guide on how to create the functionality described in the previous section. If you have any questions or suggestions for improvements, feel free to email me or comment down below.

### Generic Header File

[MyClass.h](https://raw.githubusercontent.com/justinvyu/botball/master/classes/MyClass.h)

```c
//
//  MyClass.h
//  Source written by someone
//

#include <kipr/botball.h>

// Include the other class files

#include "Controller.h"
#include "Create.h"
#include "Camera.h"

// Define a "class" for your robot

typedef struct MyClass {
    Controller controller; // refers to the wallaby controller
    Create create; // refers to your create
    // Camera camera; // uncomment if you have a camera

    // Custom properties/instance methods

    int a_property;

    // instance methods must be listed as FUNCTION POINTERS
    // that's what the little star (*) is for
    void (*an_instance_method)();

} MyClass;

extern MyClass new_robot(int a_property); // constructor

// Global robot object
MyClass robot;
```

### The Implementation File

[MyClass.c](https://raw.githubusercontent.com/justinvyu/botball/master/classes/MyClass.c)

```c
//
//  MyClass.c
//  Source written by someone
//

#include "MyClass.h"

// custom subroutines

static void an_instance_method() {
    robot.create.forward(10, 200);
}

// constructor - create a robot

MyClass new_robot(int a_property) {
    MyClass instance = {
        // In your constructor, you need to set 
        // every instance variable / method

        .a_property = a_property, // assign variables from the constructor
        .an_instance_method = &an_instance_method // assign to the function pointer
    };

    // Instantiate your controller, create, etc.
    instance.controller = new_create_controller();
    instance.create = new_create();
    // instance.camera = new_camera(); // uncomment if you have a camera

    return instance;
}
```

By the way, the `.a_property = a_property` is just shorthand for `instance.a_property = a_property`. 

And `.an_instance_method = &an_instance_method` is just shorthand for `instance.an_instance_method = &an_instance_method`.

Read [this](http://stackoverflow.com/questions/840501/how-do-function-pointers-in-c-work) to learn more about function pointers.

### Example main.c

[main.c](https://raw.githubusercontent.com/justinvyu/botball/master/classes/main.c)

```c
#include <kipr/botball.h>

#include "MyClass.h"

int main()
{
    // instantiate your global robot object
    robot = new_robot(4);

    robot.create.connect();
    robot.controller.motor(0, 80);
    robot.an_instance_method();
    printf("%d", robot.a_property);

    robot.create.disconnect();

    return 0;
}
```

---

## Contributing

I'm open to any contributions to the libraries as they are still a major WIP. Feel free to visit the [Github](https://github.com/justinvyu/botball) and submit a pull request.

Contact me at [justin.v.yu@gmail.com]() if anything is breaking / you have any questions.