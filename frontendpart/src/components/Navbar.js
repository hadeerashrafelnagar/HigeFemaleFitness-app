import React, { useEffect } from "react";
import { Link, useHistory, useLocation } from "react-router-dom";
import Swal from "sweetalert2/dist/sweetalert2.js";
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap/dist/js/bootstrap.min.js";
import "../style/NavCSS.css";
import mylogo from "../images/logo.jpg";
import { axiosInstance } from "../js/network/index";

const Navbar = () => {
  const location = useLocation();
  const history = useHistory();
  let token = localStorage.getItem("token");
  let username = localStorage.getItem("username");
  let is_staff = localStorage.getItem("is_staff");

  function logoutHandle() {
    axiosInstance.post("http://127.0.0.1:8000/rest-auth/logout/").then(() => {
      localStorage.clear();
      history.push("/");
    });
  }

  useEffect(() => {}, [location]);

  async function setIssue() {
    const { value: content } = await Swal.fire({
      input: "textarea",
      title: "Report an Issue",
      inputLabel: "Message",
      confirmButtonColor: "#35858B",
      confirmButtonText: "Send",
      inputPlaceholder: "Type your message here...",
      inputAttributes: {
        "aria-label": "Type your message here",
      },
      showCancelButton: true,
    });
    axiosInstance.post("http://127.0.0.1:8000/users/reportIssue/", {
      content: content,
    });
  }

  return (
    <>
      <nav id="navbar" className="navbar navbar-expand-lg ">
        <div className="container">
          <div className="navbar-brand">
            <Link className="navbar-item" to="/">
              <img src={`${mylogo}`} id="logo" className="img-radius" />
            </Link>
          </div>

          <button
            className="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span className="navbar-toggler-icon text-white"></span>
          </button>

          <div className="collapse navbar-collapse" id="navbarSupportedContent">
            <ul className="navbar-nav me-auto mb-2 mb-lg-0 navbar-start">
              <li className="nav-item hoverable">
                <Link className="nav-link" aria-current="page" to="/">
                  <strong>Home</strong>
                </Link>
              </li>

              <li className="nav-item hoverable">
                <Link className="nav-link" to={"/gymslocations"}>
                  {" "}
                  <strong>Gyms</strong>
                </Link>
              </li>

              <li className="nav-item hoverable">
                <Link className="nav-link" to={"/clothing"}>
                  {" "}
                  <strong>Shops</strong>
                </Link>
              </li>

              <li className="nav-item hoverable">
                <Link className="nav-link" to={"/posts"}>
                  {" "}
                  <strong>Community</strong>
                </Link>
              </li>
              <li className="nav-item dropdown" id="myDropdown">
                <Link
                  className="nav-link dropdown-toggle"
                  to="/"
                  data-bs-toggle="dropdown"
                >
                  {" "}
                  <strong>Fitness Tracker</strong>{" "}
                </Link>
                <ul className="dropdown-menu">
                  <li>
                    {" "}
                    <Link className="dropdown-item" to="/">
                      {" "}
                      Plans{" "}
                    </Link>
                    <ul className="submenu dropdown-menu">
                      <li>
                        <Link className="dropdown-item" to={"/workoutplans"}>
                          Workout
                        </Link>
                      </li>
                      <li>
                        <Link className="dropdown-item" to={"/yogaplans"}>
                          Yoga
                        </Link>
                      </li>
                    </ul>
                  </li>
                  {is_staff === "true" ? (
                    <span></span>
                  ) : (
                    <li>
                      {" "}
                      <Link className="dropdown-item" to="/">
                        {" "}
                        Healthy Life{" "}
                      </Link>
                      <ul className="submenu dropdown-menu">
                        <li>
                          <Link className="dropdown-item" to={"/water"}>
                            {" "}
                            Water Tracker
                          </Link>
                        </li>
                        <li>
                          <Link className="dropdown-item" to={"/we"}>
                            Weight Tracker
                          </Link>
                        </li>
                        <hr className="navbar-divider" />
                        <li>
                          <Link className="dropdown-item" to={"/healthytips"}>
                            <strong>Healthy Tips</strong>
                          </Link>
                        </li>
                      </ul>
                    </li>
                  )}
                  {is_staff === "false" ? (
                    <Link className="dropdown-item" to="/choosetrainer">
                      {" "}
                      Choose Trainer{" "}
                    </Link>
                  ) : null}
                  <hr className="navbar-divider" />
                  {token ? (
                    <li onClick={() => setIssue()}>
                      <Link className="dropdown-item" to="/">
                        <strong>Report an issue </strong>{" "}
                      </Link>
                    </li>
                  ) : (
                    <>
                      <span></span>
                    </>
                  )}
                </ul>
              </li>
              {is_staff === "false" ? (
                <li className="nav-item hoverable">
                  <Link className="nav-link" to={"/favplans"}>
                    {" "}
                    <strong>Favourite Plans</strong>
                  </Link>
                </li>
              ) : null}

              {!token ? (
                <li className="nav-item hoverable">
                  <Link className="nav-link" to="/joinus">
                    {" "}
                    <strong>Join Us</strong>
                  </Link>
                </li>
              ) : (
                <>
                  <span></span>
                </>
              )}
            </ul>
            {token ? (
              <li className="nav-item dropdown" id="myDropdown">
                <Link
                  className="nav-link dropdown-toggle"
                  to="/"
                  data-bs-toggle="dropdown"
                >
                  {" "}
                  <strong>{username}</strong>{" "}
                </Link>
                <ul className="dropdown-menu">
                  <li>
                    {" "}
                    <Link
                      className="dropdown-item"
                      to={
                        is_staff === "false"
                          ? "trainee/"
                          : "trainer/"
                      }
                    >
                      {" "}
                      <li className="navbar-item hoverable">Your Profile</li>
                    </Link>
                  </li>
                  {is_staff === "false" ? (
                    <li>
                      {" "}
                      <Link className="dropdown-item" to={"/taskmanagar"}>
                        {" "}
                        <li className="navbar-item">Your Task Manager</li>
                      </Link>
                    </li>
                  ) : (
                    <span></span>
                  )}
                </ul>
              </li>
            ) : (
              <span></span>
            )}

            <div className="d-grid gap-2 d-md-flex ">
              {token ? (
                <Link
                  className="btn btn-light hoverable"
                  to="/"
                  onClick={logoutHandle}
                >
                  {" "}
                  <strong>Log out</strong>
                </Link>
              ) : (
                <Link id="sign-btn" className="btn  hoverable" to={"/signup"}>
                  {" "}
                  <strong>Sign up</strong>
                </Link>
              )}
              {!token ? (
                <Link className="btn btn-light hoverable" to={"/login"}>
                  {" "}
                  <strong>Log In</strong>
                </Link>
              ) : (
                <>
                  <span></span>
                </>
              )}
            </div>
          </div>
        </div>
      </nav>
    </>
  );
};
export default Navbar;