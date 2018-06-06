;; Auto-generated. Do not edit!


(when (boundp 'frontier_exploration::BlacklistPoint)
  (if (not (find-package "FRONTIER_EXPLORATION"))
    (make-package "FRONTIER_EXPLORATION"))
  (shadow 'BlacklistPoint (find-package "FRONTIER_EXPLORATION")))
(unless (find-package "FRONTIER_EXPLORATION::BLACKLISTPOINT")
  (make-package "FRONTIER_EXPLORATION::BLACKLISTPOINT"))
(unless (find-package "FRONTIER_EXPLORATION::BLACKLISTPOINTREQUEST")
  (make-package "FRONTIER_EXPLORATION::BLACKLISTPOINTREQUEST"))
(unless (find-package "FRONTIER_EXPLORATION::BLACKLISTPOINTRESPONSE")
  (make-package "FRONTIER_EXPLORATION::BLACKLISTPOINTRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass frontier_exploration::BlacklistPointRequest
  :super ros::object
  :slots (_point ))

(defmethod frontier_exploration::BlacklistPointRequest
  (:init
   (&key
    ((:point __point) (instance geometry_msgs::Point :init))
    )
   (send-super :init)
   (setq _point __point)
   self)
  (:point
   (&rest __point)
   (if (keywordp (car __point))
       (send* _point __point)
     (progn
       (if __point (setq _point (car __point)))
       _point)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point _point
    (send _point :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point _point
       (send _point :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point _point
     (send _point :deserialize buf ptr-) (incf ptr- (send _point :serialization-length))
   ;;
   self)
  )

(defclass frontier_exploration::BlacklistPointResponse
  :super ros::object
  :slots ())

(defmethod frontier_exploration::BlacklistPointResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass frontier_exploration::BlacklistPoint
  :super ros::object
  :slots ())

(setf (get frontier_exploration::BlacklistPoint :md5sum-) "a7c84ff13976aa04656e56e300124444")
(setf (get frontier_exploration::BlacklistPoint :datatype-) "frontier_exploration/BlacklistPoint")
(setf (get frontier_exploration::BlacklistPoint :request) frontier_exploration::BlacklistPointRequest)
(setf (get frontier_exploration::BlacklistPoint :response) frontier_exploration::BlacklistPointResponse)

(defmethod frontier_exploration::BlacklistPointRequest
  (:response () (instance frontier_exploration::BlacklistPointResponse :init)))

(setf (get frontier_exploration::BlacklistPointRequest :md5sum-) "a7c84ff13976aa04656e56e300124444")
(setf (get frontier_exploration::BlacklistPointRequest :datatype-) "frontier_exploration/BlacklistPointRequest")
(setf (get frontier_exploration::BlacklistPointRequest :definition-)
      "geometry_msgs/Point point

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---

")

(setf (get frontier_exploration::BlacklistPointResponse :md5sum-) "a7c84ff13976aa04656e56e300124444")
(setf (get frontier_exploration::BlacklistPointResponse :datatype-) "frontier_exploration/BlacklistPointResponse")
(setf (get frontier_exploration::BlacklistPointResponse :definition-)
      "geometry_msgs/Point point

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---

")



(provide :frontier_exploration/BlacklistPoint "a7c84ff13976aa04656e56e300124444")


