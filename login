<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EcoMind - Environmental Education</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            font-family: 'Inter', sans-serif; /* Using Inter font as per instructions */
            background-image: url('image/Backgroundlogin.svg'); /* Placeholder for loginbackround.png */
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            min-height: 100vh;
            position: relative;
            overflow-x: hidden; 
        }

        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(255, 255, 255, 0.25);
            z-index: -1;
        }

        .main-content {
            display: flex;
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
            gap: 0; 
            align-items: flex-start;
            min-height: calc(100vh - 80px); 
            padding-top: 6rem;
            justify-content: center; 
        }

        .welcome-section {
            flex: 1;
            background-image: url('image/welcome.svg'); 
            background-size: contain;
            background-position: center;
            background-repeat: no-repeat;
            border-radius: 20px 0 0 20px;
            padding: 3rem;
            color: white;
            position: relative;
            overflow: hidden;
            height: 500px; 
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .welcome-section h1 {
            font-size: 3rem;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .login-section {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 0 20px 20px 0;
            padding: 2rem;
            width: 350px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            height: 500px; 
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .login-section h2 {
            text-align: center;
            margin-bottom: 2rem;
            color: #333;
            font-size: 2rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group input {
            width: 100%;
            padding: 0.8rem;
            border: 2px solid #ddd;
            border-radius: 10px;
            font-size: 1rem;
            transition: border-color 0.3s;
            background: rgba(255, 255, 255, 0.5);
        }

        .form-group input:focus {
            outline: none;
            border-color: #4682B4; 
        }

        .password-field {
            position: relative;
        }

        .password-toggle {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #666;
        }

        .password-toggle img {
            width: 20px;
            height: 20px;
        }

        .login-button {
            width: 100%;
            padding: 0.8rem;
            background: #9ACD32; 
            border: none;
            border-radius: 10px;
            font-size: 1rem;
            font-weight: bold;
            color: #2d5016;
            cursor: pointer;
            transition: background 0.3s;
            margin-bottom: 1rem;
        }

        .login-button:hover {
            background: #8FBC8F; 
        }

        .social-login {
            display: flex;
            gap: 1rem;
            margin-bottom: 1rem;
        }

        .social-btn {
            flex: 1;
            padding: 0.6rem;
            border: 2px solid #ddd;
            border-radius: 8px;
            background: white;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            font-size: 0.9rem;
        }

        .social-btn:hover {
            border-color: #4682B4; 
            background: #f0f8ff; 
        }

        .register-btn {
            width: 100%;
            padding: 0.8rem;
            background: transparent;
            border: 2px solid #9ACD32;
            border-radius: 10px;
            font-size: 1rem;
            color: #2d5016; 
            cursor: pointer;
            transition: all 0.3s;
        }

        .register-btn:hover {
            background: #9ACD32; 
            color: white;
        }

        @media (max-width: 768px) {
            .main-content {
                flex-direction: column;
                gap: 1rem;
                padding: 1rem;
                padding-top: 6rem; 
            }

            .welcome-section {
                width: 100%;
                border-radius: 20px;
                height: auto;
                padding: 2rem;
            }

            .welcome-section h1 {
                font-size: 2rem; 
            }

            .login-section {
                width: 100%;
                max-width: 400px; 
                border-radius: 20px; 
                height: auto; 
                align-self: center; 
            }
        }

        .modal {
            display: none; 
            position: fixed; 
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%; 
            height: 100%; 
            overflow: auto; 
            background-color: rgba(0,0,0,0.4); 
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 400px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            text-align: center;
            position: relative;
        }

        .close-button {
            color: #aaa;
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close-button:hover,
        .close-button:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body class="bg-gray-100">

    <header class="fixed top-0 left-0 w-full bg-white shadow-md z-50 py-4 px-6 md:px-12 flex justify-between items-center rounded-b-lg">
        <div class="flex items-center space-x-2">
            <img src="image/logo.png" alt="Ecomind Logo" class="w-10 h-10 rounded-full">
            <span class="text-xl font-semibold text-gray-800">Ecomind</span>
        </div>
        <nav class="hidden md:flex items-center space-x-8">
            <a href="home.html" class="text-gray-700 hover:text-green-600 font-medium transition-colors duration-300">Home</a>
            <a href="aboutus.html" class="text-gray-700 hover:text-green-600 font-medium transition-colors duration-300">About Us</a>
            <a href="modulehomepage.html" class="text-gray-700 hover:text-green-600 font-medium transition-colors duration-300">Module</a>
            <a href="gamehomepage.html" class="text-gray-700 hover:text-green-600 font-medium transition-colors duration-300">Game</a>
            <a href="login.html" class="bg-[#B0CC29] text-black px-8 py-3 rounded-full hover:bg-opacity-80 transition-colors duration-300 shadow-lg font-semibold inline-block">Login</a>
        </nav>
        <button class="md:hidden text-gray-700 text-2xl" id="hamburger-button"> &#9776; </button>
    </header>

    <main class="main-content">
        <section class="welcome-section">
        </section>

        <section class="login-section">
            <h2>Login</h2>
            <form id="loginForm">
                <div class="form-group">
                    <input type="email" id="email" placeholder="Email" required>
                </div>
                <div class="form-group">
                    <div class="password-field">
                        <input type="password" id="password" placeholder="Password" required>
                        <span class="password-toggle" onclick="togglePassword()">
                            <img id="passwordToggleImg" src="https://placehold.co/20x20/CCCCCC/000000?text=👁️" alt="Show password">
                        </span>
                    </div>
                </div>
                <button type="submit" class="login-button">Login</button>
            </form>

            <div class="social-login">
                <button class="social-btn" onclick="socialLogin('facebook')">
                    <img src="https://placehold.co/16x16/3B5998/FFFFFF?text=f" alt="Facebook" width="16" height="16"> Facebook
                </button>
                <button class="social-btn" onclick="socialLogin('google')">
                    <img src="https://placehold.co/16x16/DB4437/FFFFFF?text=G" alt="Google" width="16" height="16"> Google
                </button>
            </div>

            <button class="register-btn" onclick="showRegister()">Register</button>
        </section>
    </main>

    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close-button" onclick="closeModal()">&times;</span>
            <p id="modalMessage"></p>
            <button class="login-button mt-4" onclick="closeModal()">OK</button>
        </div>
    </div>

    <script>
        function showModal(message) {
            document.getElementById('modalMessage').textContent = message;
            document.getElementById('myModal').style.display = 'flex'; 
        }

        // Function to close the custom modal
        function closeModal() {
            document.getElementById('myModal').style.display = 'none';
        }

        document.getElementById('loginForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            
            if (email && password) {
                showModal(`Welcome back! Login successful for ${email}`);
                // Here you would typically send the data to your server
                console.log('Login attempt:', { email, password });
            } else {
                showModal('Please fill in all fields');
            }
        });

        function togglePassword() {
            const passwordField = document.getElementById('password');
            const toggleImg = document.getElementById('passwordToggleImg');
            
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                toggleImg.src = 'https://placehold.co/20x20/CCCCCC/000000?text=🙈'; 
                toggleImg.alt = 'Hide password';
            } else {
                passwordField.type = 'password';
                toggleImg.src = 'https://placehold.co/20x20/CCCCCC/000000?text=👁️'; 
                toggleImg.alt = 'Show password';
            }
        }

        function socialLogin(provider) {
            showModal(`Redirecting to ${provider} login...`);
            // Here you would typically redirect to the social media OAuth flow
            console.log(`Social login with ${provider}`);
        }

        function showRegister() {
            showModal('Redirecting to registration page...');
            // Here you would typically redirect to a registration form
            console.log('Navigate to registration');
        }

        document.getElementById('hamburger-button').addEventListener('click', function() {
            const navLinks = document.querySelector('header nav'); // Select the nav element
            navLinks.classList.toggle('hidden'); // Toggle the 'hidden' class to show/hide
            navLinks.classList.toggle('flex'); // Add flex to make it a column
            navLinks.classList.toggle('flex-col'); // Add flex-col for vertical stacking
            navLinks.classList.toggle('absolute'); // Position absolutely for overlay
            navLinks.classList.toggle('top-full'); // Place below the header
            navLinks.classList.toggle('left-0'); // Span full width
            navLinks.classList.toggle('w-full'); // Span full width
            navLinks.classList.toggle('bg-white'); // Background for the menu
            navLinks.classList.toggle('shadow-lg'); // Shadow for the menu
            navLinks.classList.toggle('py-4'); // Padding
            navLinks.classList.toggle('items-center'); // Center items
            navLinks.classList.toggle('space-y-4'); // Space between links
            navLinks.classList.toggle('md:hidden'); // Ensure it's hidden on medium screens
        });
        
        document.querySelectorAll('header nav a').forEach(link => {
            link.addEventListener('click', function(e) {
                // Close mobile menu if open
                const navLinks = document.querySelector('header nav');
                if (!navLinks.classList.contains('hidden')) {
                    navLinks.classList.add('hidden');
                    navLinks.classList.remove('flex', 'flex-col', 'absolute', 'top-full', 'left-0', 'w-full', 'bg-white', 'shadow-lg', 'py-4', 'items-center', 'space-y-4');
                }

                if (this.hash !== "") {
                    e.preventDefault();
                    const targetId = this.getAttribute('href');
                    const targetElement = document.querySelector(targetId);
                    if (targetElement) {
                        const headerOffset = document.querySelector('header').offsetHeight;
                        const elementPosition = targetElement.getBoundingClientRect().top + window.pageYOffset;
                        const offsetPosition = elementPosition - headerOffset;

                        window.scrollTo({
                            top: offsetPosition,
                            behavior: "smooth"
                        });
                    }
                }
                console.log(`Navigating to ${this.getAttribute('href')}`);
            });
        });
    </script>
</body>
</html>
