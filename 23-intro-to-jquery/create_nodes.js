// vanilla DOM manipulation
newElement = document.createElement('h1');
newElement.innerHTML = 'Created by vanilla JS';

containerDiv = document.createElement('div');
containerDiv.className = "container";

containerDiv.appendChild(newElement);

document.body.appendChild(containerDiv);
