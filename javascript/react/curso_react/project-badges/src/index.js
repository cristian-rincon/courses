// const element = document.createElement('h1');
// element.innerText = 'Hello, Platzi Badges!';

// const container = document.getElementById('app');

// container.appendChild(element);

import React from "react";
import ReactDOM from "react-dom";

import "bootstrap/dist/css/bootstrap.css";
import "./global.css"
import Badge from "./components/Badge";

const container = document.getElementById("app");

// ReactDOM.render(__qué__, __dónde__);
ReactDOM.render(<Badge firstName="Cristian" lastName="Rincón" jobTitle="Backend Developer" socialMedia="uncristianr" avatarUrl="https://www.gravatar.com/avatar?d=identicon"/>, container);
