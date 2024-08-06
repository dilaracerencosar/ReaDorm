function register() {
    const username = document.getElementById('regUsername').value;
    const password = document.getElementById('regPassword').value;
  
    const xhr = new XMLHttpRequest();
    xhr.open('POST', 'register.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
  
    xhr.onload = function () {
      if (xhr.status === 200) {
        alert(xhr.responseText);
      } else {
        alert('Error registering user.');
      }
    };
  
    const data = `username=${username}&password=${password}`;
    xhr.send(data);
  }
  
  function login() {
    const username = document.getElementById('loginUsername').value;
    const password = document.getElementById('loginPassword').value;
  
    const xhr = new XMLHttpRequest();
    xhr.open('POST', 'login.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
  
    xhr.onload = function () {
      if (xhr.status === 200) {
        alert(xhr.responseText);
      } else {
        alert('Invalid username or password.');
      }
    };
  
    const data = `username=${username}&password=${password}`;
    xhr.send(data);
  }