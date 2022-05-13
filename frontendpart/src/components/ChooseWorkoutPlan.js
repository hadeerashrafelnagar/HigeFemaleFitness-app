import React from "react";
import { useLocation } from "react-router-dom/cjs/react-router-dom.min";
import { axiosInstance } from "../js/network/index";
import {
  NotificationContainer,
  NotificationManager,
} from "react-notifications";
import "../style/Homepage.css"

const ChooseWorkoutPlan = (props) => {
  const { WorkoutPlans } = props;
  const location = useLocation();
  const editPlan = (id) => {
    NotificationManager.success(
      "your choice has been added to your trainee"
    );
    axiosInstance.put("http://127.0.0.1:8000/updateTraineeFavPlans/", {
      id: location.id,
      workoutID: id,
      editedstatus:true
    });

  };
  
  return (
    <>
    <div style={{paddingTop:"5em", backgroundColor:"#f9f9fa"}}>
      <h1 className="f h1 d-flex justify-content-center mt-5">
        Choose Work<span className="text-info">out</span>&nbsp;Plans
      </h1>

      <ul className="list-group list-group-flush">
        {WorkoutPlans.map((plan) => {
          return (
            <div className="text-center mt-3" id="cur" key={plan.id}>
              <span id="uname" onClick={() => editPlan(plan.id)}>
                {plan.name}
              </span>
              <br />
              <br />
              <hr className="col-md-4 d-flex align-content-center" id="linee" />
              <NotificationContainer />
            </div>
          );
        })}
      </ul>
      </div>
    </>
  );
};
export default ChooseWorkoutPlan;
