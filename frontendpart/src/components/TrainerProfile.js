import React, { useEffect, useState } from "react";
import axios from "axios";
import "../style/trainerProfile.css";
import "../style/profile.css"
import mylogo from "../images/logo.jpg";
import avatar from "../images/avatar2.png";
import { ChatDotsFill, ClockFill } from "react-bootstrap-icons";
import { axiosInstance } from "../js/network/index";
import { useHistory } from "react-router-dom";
// import Cookies from 'js-cookie';
import Swal from "sweetalert2/dist/sweetalert2.js";

import {
  NotificationContainer,
  NotificationManager,
} from "react-notifications";
import {
  Form,
  Modal,
  Button,
  InputGroup,
  FormControl,
  ModalTitle,
  ModalBody,
  ModalFooter,
  ModalHeader,
} from "react-bootstrap";
//import { post } from "jquery";
import { Link } from "react-router-dom";
import { type } from "@testing-library/user-event/dist/type";

const TrainerProfile = () => {
  console.log("locaa ",localStorage.getItem("age"))
  const [show, setShow] = useState("addpost");
  const [emptyEditAlert, setEmptyEditAlert] = useState(false);
  const [emptyAlert, setEmptyAlert] = useState(false);
  const [postForm, setPostForm] = useState({});
  const [trainerData, setTrainerData] = useState({});
  const [myPosts, setPosts] = useState([]);
  const [changeView,setChangeView]=useState(false);
  const phoneRegex = /^(?:\d{2}-\d{3}-\d{3}-\d{3}|\d{11})$/;
  const passwordRegex =/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+$/;
  const [clients, setClients] = useState([]);
  const [editForm, setEditForm] = useState({
    // age: localStorage.getItem("age"),
    address: localStorage.getItem("address"),
    phoneNumber: localStorage.getItem("phone"),
  });
  const [editFormErrors, setEditFormErrors] = useState({
    // ageErr: "",
    addressErr: "",
    phoneErr: "",
  });
  const [changePasswordForm, setChangePasswordForm] = useState({
    old_password: "",
    new_password1: "",
    new_password2: ""
  });
  const [changePasswordFormErrors, setChangePasswordFormErrors] = useState({
    old_passwordErr: "",
    password1Err: "",
    password2Err: "",
  });
// password errors 
const handlePasswordChange = (e) => {
  if (e.target.name === "old_password") {
    setChangePasswordForm({
      ...changePasswordForm,
      old_password: e.target.value.trim(),
    });
  
    setChangePasswordFormErrors({
      ...changePasswordFormErrors,
      old_passwordErr:
        e.target.value.length === 0
          ? "This Field is required"
          : e.target.value.length < 8
          ? "Length must not be less than 8"
          : passwordRegex.test(e.target.value) === false
          ? "Password must contain atleast one lowercase, one uppercase , at least one digit and special character"
          : null,
    });
  }else if (e.target.name === "new_password1") {
    setChangePasswordForm({
      ...changePasswordForm,
      new_password1: e.target.value.trim(),
    });
  
    setChangePasswordFormErrors({
      ...changePasswordFormErrors,
      password1Err:
        e.target.value.length === 0
          ? "This Field is required"
          : e.target.value.length < 8
          ? "Length must not be less than 8"
          : passwordRegex.test(e.target.value) === false
          ? "Password must contain atleast one lowercase, one uppercase , at least one digit and special character"
          : null,
    });
  }else if (e.target.name === "new_password2") {
    setChangePasswordForm({
      ...changePasswordForm,
      new_password2: e.target.value.trim(),
    });
    setChangePasswordFormErrors({
      ...changePasswordFormErrors,
      password2Err:
        e.target.value.length === 0
          ? "This Field is required"
          : e.target.value != changePasswordForm.new_password1
          ? "Password doesn't match"
          : null,
    });
  
  }
else {

}

}
// edit form changes
  const handleChanges = (e) => {
    if (e.target.name === "age") {
      setEditForm({
        ...editForm,
        age: e.target.value,
      });

      setEditFormErrors({
        ...editFormErrors,
        ageErr:
          e.target.value.length === 0
            ? "This Field is required"
            : isNaN(e.target.value)
            ? "this field must be a number"
            : null,
      });
    } else if (e.target.name === "address") {
      setEditForm({
        ...editForm,
        address: e.target.value,
      });

      setEditFormErrors({
        ...editFormErrors,
        addressErr:
          e.target.value.length === 0 ? "This Field is required" : null,
      });
    } else if (e.target.name === "phone") {
      setEditForm({
        ...editForm,
        phoneNumber: e.target.value,
      });

      setEditFormErrors({
        ...editFormErrors,
        phoneErr:
          e.target.value.length === 0
            ? "This Field is required"
            : phoneRegex.test(e.target.value) === false
            ? "enter a valid phone number"
            : null,
      });
    } else {
    }
  };
  // post input form
  const handleChange = (e) => {
    setPostForm({
      ...postForm,
      [e.target.name]: e.target.value,
    });
  };
  // add new post
  const handleSubmit = (e) => {
    e.preventDefault();
    console.log(postForm);
    axiosInstance
      .post("http://127.0.0.1:8000/posts/", postForm, {})
      .then(() => {
        console.log("post submitted ");
        showPosts();
        setShow("posts");
      })
      .catch(console.log("try again"));
  };
  // get all trainee posts add the latest to top
  const showPosts = () => {
    axiosInstance.get("getTrainerPosts/").then((data) => {
      console.log(data.data);
      setPosts(data.data.result.reverse());
      console.log(myPosts);
    });
  };
  // get traier object
  const getTrainerData = () => {
    axiosInstance
      .get("users/trainerDetail/")
      .then((data) => {
        console.log(data.data);
        setTrainerData(() => {
          return (trainerData.data = data.data.trainer[0].fields);
        });
      })
      .then(() => console.log(trainerData));
  };
  // edit trainer profile
  const handleEditFormSubmit = (e) => {
    e.preventDefault();
    console.log(editForm.phoneNumber.length,editForm.address.length);
    if (
      
      editForm.phoneNumber.length == 0 &&
      editForm.address.length === 0
    ) 
    {
      NotificationManager.error(
        "Form is empty"
      )
      setEmptyEditAlert(true)
    }
    
    else if (editForm.phoneNumber.length === 0) { setEmptyEditAlert(true)}
    else if (editForm.address.length === 0) { setEmptyEditAlert(true)}
    else {
      setEmptyEditAlert(false);
      axiosInstance
        .put("users/editTrainerProfile/", editForm, {})
        .then(() => {
          console.log("Profile updated ");
          // bring the newest record
          getTrainerData();
          // show profile view
          setShow("profile");
          //show success alert
          NotificationManager.success("Profile data is updated successfully")
        })
        .catch(console.log("try again"));
    }
  };
const getClient=()=>{
  axiosInstance.post('getTraineeDetailsForTrainerViewSet/',{id:37})
  .then((data)=>console.log(data))
  .catch((err)=>console.log(err.data))
 }
// changePassword
const changePassword=()=>{
  setChangeView(true)
}
// submit Change Password Form 
const  handleChangePasswordSubmit =(e)=>{
  e.preventDefault();
  console.log(changePasswordForm.old_password.length,changePasswordForm.new_password1,changePasswordForm.new_password2);
  if (
    changePasswordForm.old_password.length === 0 &&
    changePasswordForm.new_password1.length===0 &&
    changePasswordForm.new_password2.length === 0
  )
   {
    NotificationManager.error(
      "Form is empty"
    )
    setEmptyAlert(true);
    
  }
  else if (changePasswordForm.old_password.length === 0 ){
    setEmptyAlert(true);
    console.log("empty form");}
  else if(changePasswordForm.new_password1.length=== 0 ){setEmptyAlert(true);}
  else if(changePasswordForm.new_password2.length === 0 ){setEmptyAlert(true);}
  else if (changePasswordForm.new_password1!==changePasswordForm.new_password2){
    NotificationManager.warning(
      "the 2 passwords aren't identical"
    )
  }
  else {
  axiosInstance.post('rest-auth/password/change/',changePasswordForm)
  .then((data)=>{ 
    NotificationManager.success(
    "New Password is saved successfully"
  )
  
  setChangeView(false)
  setEmptyAlert(false)
  })
  .catch((err)=> {
  
  try {
      console.log((err.response.data.old_password.toString()))
      NotificationManager.error(
        "This old password isn't valid "
      )
      }
    catch(err){
      console.log("something went wrong")
      NotificationManager.error(
        "something went wrong"
      )
    }
  
  
  }) }
  
  }
// get user Clients 
const showClients = () => {
  axiosInstance.get("getTrainerClients/").then((data) => {
    setClients(data.data.result);
  });
};
const resetStates=()=>{
  setEmptyEditAlert(false)
  setEmptyAlert(false)
  setChangeView(false)
  setEditForm({
    age: TrainerProfile.age,
    address: TrainerProfile.address,
    phoneNumber: TrainerProfile.address.phone,
  })
  setEditFormErrors({
    ageErr: "",
    addressErr: "",
    phoneErr: "",
  })
  setChangePasswordFormErrors({
    old_passwordErr: "",
    password1Err: "",
    password2Err: "",
  })
}


  async function editPost(pk) {
    const { value: text } = await Swal.fire({
      input: 'textarea',
      inputLabel: 'Edit Post',
      inputPlaceholder: 'Type your Post here...',
      inputAttributes: {
        'aria-label': 'Type your message here'
      },
      showCancelButton: true
    })
    
    if (text) {
      Swal.fire("post is updated successfully")
      axiosInstance.put(`/posts/${pk}/`,{'text':text})
      .then(()=>{
        Swal.fire('Post is updated successfully', '', 'success')
        showPosts ()
      })
      .catch(
        (err)=>{console.log(err)
        NotificationManager.error("something went wrong")})
    }

  }
async function deletePost(pk){
  Swal.fire({
    title: 'Are You Sure You want to delete this post?',
    showDenyButton: true,
    showCancelButton: true,
    confirmButtonText: 'Yes',
    denyButtonText: 'No',
    customClass: {
      actions: 'my-actions',
      cancelButton: 'order-1 right-gap',
      confirmButton: 'order-2',
      denyButton: 'order-3',
    }
  }).then((result) => {
    if (result.isConfirmed) {
    
      axiosInstance.delete(`/posts/${pk}/`)
      .then(()=>{
         Swal.fire('Post is deleted successfully', '', 'success')
        // NotificationManager.success("updated")
        showPosts ()
      })
      .catch(
        (err)=>{console.log(err)
        NotificationManager.error("something went wrong")})
    }
    
     else if (result.isDenied) {
      Swal.fire('ok!', '', 'info')
    }
  })
  
  
}

  return (
    <>
    <div className="padding">
      <div className="container" id="Trainer_Profile">
        <div className="main-body">
          <div className="row mt-6">
            <div className="bg-light">
              <div className="card-body">
                <div className="d-flex flex-column align-items-center text-center">
                  <img 
                    src={`http://localhost:8000/media/${localStorage.getItem(
                      "image"
                    )}`}
                    alt="Admin"
                    className="rounded-circle"
                    width="150"
                  /> 
                </div>
                <div className="mt-3 d-flex flex-column align-items-center text-center">
                  <h4>{localStorage.getItem("username")}</h4>
                  <p className="text-secondary mb-1">Fitness Trainer</p>
                </div>
                <br /> <br />
                <button
                  className="btn col-md-3"
                  id="btnn1"
                  onClick={() => { 
                  setShow("addpost")
                  resetStates()
                }}
                >
                  Add New Post
                </button>
                <button
                  className="btn col-md-3"
                  id="btnn2"
                  onClick={() => {
                    setShow("posts");
                    showPosts();
                    resetStates()
                  }}
                >
                  View My Posts
                </button>
                <button
                  className="btn col-md-2"
                  id="btnn3"
                  onClick={() => {
                    setShow("clients")
                    showClients();
                    resetStates();
                   
                  }}
                >
                  Review Clients
                </button>
                <button
                  className="btn col-md-3"
                  id="btnn4"
                  onClick={() => {
                    setShow("profile");
                    getTrainerData();
                    resetStates();
                    
                  }}
                >
                  View Personal Information
                </button>
              </div>

              <div className="row mt-6">
                <>
                  {show == "addpost" ? (
                    <form onSubmit={handleSubmit}>
                      <textarea
                        className="form-control"
                        placeholder="Please Enter your post"
                        name="text"
                        value={postForm.text}
                        onChange={(e) => handleChange(e)}
                      />
                      <br />
                      <br />
                      <button className="btn" type="submit" id="btnn5">
                        {" "}
                        submit post
                      </button>
                    </form>
                  ) : show == "posts" ? (
                    <>
                      <h1 className="text-white bck">My Posts</h1>
                      <ul
                        className="list-group list-group-flush p-2"
                        id="trainerPostList"
                      >
                        <p> Numbers of posts: <span id='numP'>{myPosts.length}</span></p>
                        {myPosts.map((post) => {
                          return (
                            // why it doesn't work ?
                            <li
                              className="list-group-item w-100 p-2 d-flex d-flex"
                               id="postContent"
                              key={post.pk}
                            >
                              <p className="" id="cut_text">
                                {" "}
                                <Link id="link" to={`/comm/${post.pk}`}>
                                  {post.fields.text}
                                </Link>
                              </p>
                             <i title="edit post" onClick={()=>editPost(post.pk)} className="bi bi-pencil"></i>
                             <i title="delete post" onClick={()=>deletePost(post.pk)}  className="bi bi-x-lg text-danger"></i>
                              <small>
                                {new Date(post.fields.createdAt).toLocaleString(
                                  "en-US"
                                )}{" "}
                              </small>
                            </li>
                          );
                        })}
                      </ul>
                    </>
                  ) : show == "edit" ? (
                    <div className="row">
                      <div className="col-12 col-md-6">
                        <h2>Edit profile </h2>
                        {emptyEditAlert ? (
                          <p className="text-danger mt-3">Fill the empty fields</p>
                        ) : (
                          <></>
                        )}
                        {/* //<p className="text-success">Form is submitted successfully</p> */}
                        <form
                          id="editTrainerForm"
                          className=""
                          onSubmit={handleEditFormSubmit}
                         >
                          <div id="form" className="container">
                            {/* <div className="input-container mt-6">
                              <label for="age" className="text-white">
                                Age
                              </label>
                              <input
                                id="age"
                                className="mt-2 input"
                                type="text"
                                placeholder=" "
                                name="age"
                                value={editForm.age}
                                onChange={(e) => handleChanges(e)}
                              />
                              <div>
                                <small className="text-danger py-3">
                                  {editFormErrors.ageErr}
                                </small>
                              </div>
                            </div> */}
                            <div className="input-container mt-6">
                              <label for="phone" className="text-white">
                                Phone Number
                              </label>
                              <input
                                id="phone"
                                className="mt-2 input"
                                type="text"
                                placeholder=" "
                                name="phone"
                                value={editForm.phoneNumber}
                                onChange={(e) => handleChanges(e)}
                              />
                              <div>
                                <small className="text-danger">
                                  {editFormErrors.phoneErr}
                                </small>
                              </div>
                            </div>
                            <div className="input-container mt-6">
                              <label for="address" className="text-white">
                                Description
                              </label>
                              <input
                                id="address"
                                className="mt-2 input"
                                type="text"
                                placeholder=" "
                                name="address"
                                value={editForm.address}
                                onChange={(e) => handleChanges(e)}
                              />
                              <div>
                                <small className="text-danger">
                                  {editFormErrors.addressErr}
                                </small>
                              </div>
                            </div>
                            
                            <button
                              type="submit"
                              id="submit"
                              className="mt-6 btn"
                            >
                              Save changes
                            </button>
                          </div>
                        </form>
                      </div>
                      <div className="col-12 col-md-6 password">
                        <h2 className="">Profile Settings</h2>
                        {emptyAlert ? (
                          <p className="text-danger mt-3">Fill the empty fields</p>
                        ) : (
                          <></>
                        )}
                        { changeView ==false?
                        <>
                        {/* <button id="reset" className="mt-6" onClick={()=>resetPassword()}>
                          Reset password
                        </button> */}
                        <button id="changePassword" className="mt-6" onClick={()=>changePassword()}>
                          Change password
                        </button>
                        </>
                        :
                        <>
                        {/* change password form */}
                        
                        <form
                        className="border border-2"
                          id="changePasswordForm"
                          onSubmit={handleChangePasswordSubmit}
                        >
                          <div id="form" className="container ">
                            <div className="input-container mt-6">
                              <label for="age" className="text-white">
                                Enter old Password
                              </label>
                              <input
                                id="age"
                                className="mt-2 input"
                                type="text"
                                placeholder=" "
                                name="old_password"
                                value={changePasswordForm.old_password}
                                onChange={(e) => handlePasswordChange(e)}
                              />
                              <div>
                                <small className="text-danger py-3">
                                  {changePasswordFormErrors.old_passwordErr}
                                </small>
                              </div>
                            </div>
                            <div className="input-container mt-6">
                              <label for="num" className="text-white">
                                Enter New password
                              </label>
                              <input
                                id="num"
                                className="mt-2 input"
                                type="text"
                                placeholder=" "
                                name="new_password1"
                                value={changePassword.new_password1}
                                onChange={(e) => handlePasswordChange(e)}
                              />
                              <div>
                                <small className="text-danger">
                                  {changePasswordFormErrors.password1Err}
                                </small>
                              </div>
                            </div>
                            <div className="input-container mt-6">
                              <label for="address" className="text-white">
                                Confirm New Password
                              </label>
                              <input
                                id="address"
                                className="mt-2 input"
                                type="text"
                                placeholder=" "
                                name="new_password2"
                                value={changePasswordForm.new_password2}
                                onChange={(e) => handlePasswordChange(e)}
                              />
                              <div>
                                <small className="text-danger">
                                  {changePasswordFormErrors.password2Err}
                                </small>
                              </div>
                            </div>
                            <br />
                            <br />
                            <button
                              type="submit"
                              id="submit"
                              className="mt-6 btn "
                            >
                              Save changes
                            </button>
                          </div>
                        </form>

                        </>


                        }
                      </div>
                    </div>
                  ) : show == "profile" ? (
                    <div className="col-12 col-md-12" id="profileData">
                      <div className="mt-3 d-flex flex-column align-items-center text-center">
                </div>
                <div className="row mt-3  text-black">
                  <div className="col-5">Name </div>
                  <div className="col-5">Status </div>
                  <div className="col-2 ">Date of Birth </div>
                </div>
                <div className="row mt-3 ">
                  <div className="col-5">
                    {localStorage.getItem("username")}
                  </div>
                  <div className="col-5">Active</div>
                  <div className="col-2">{localStorage.getItem("dateOfBirth")}</div>
                </div>
                <div className="row mt-3  text-black">
                  <div className="col-5">Email </div>
                  <div className="col-5 ">Description </div>
                  <div className="col-2 ">Phone </div>
                </div>
                <div className="row mt-3 ">
                  <div className="col-5">{localStorage.getItem("email")}</div>
                  <div className="col-5">
                    {trainerData.address}{" "}
                  </div>
                  <div className="col-2">{trainerData.phoneNumber} </div>
                </div>
                      <button
                        id="edit"
                        onClick={() => setShow("edit")}
                        className="mt-6"
                      >
                        Edit Profile
                      </button>
                    </div>
                  ) : (
                    <>
                    <h1 className="text-white bck" >Clients</h1>
                    <ul className="list-group list-group-flush">
                      {clients.map((client) => {
                        return (
                         
                          <div className="text-center mt-3" key={client.pk}>
                            <Link
                              to={{
                                pathname: "/TraineeInfo",
                                state: client.pk,
                              }}
                            >
                              <img
                                className="rounded-circle"
                                width="60"
                                src={`${avatar}`}
                              />
                              <br />
                              <span id="uname">{client.fields.username}</span>
                              <br/>
                            </Link>
                            <br/>
                            <hr className="col-md-4 d-flex align-content-center" id="linee" />
                          </div>
                          
                        );
                      })}
                    </ul>
                  </>
                  )}
                </>
               
              </div>
            </div>
            
          </div>
          <NotificationContainer />
        </div>
         
      </div>
      </div>
    </>
  );
};

export default TrainerProfile;