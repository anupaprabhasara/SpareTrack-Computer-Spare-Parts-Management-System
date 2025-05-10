<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create User | MediSync</title>
    <link rel="shortcut icon" href="app/assets/favicon.png" type="image/x-icon">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="bg-gray-100 dark:bg-gray-900 flex">

<%@ include file="../partials/sidebar.jsp"%>

	<!-- Main Content -->
	<main class="flex-1 p-6">
	    <h1 class="text-3xl font-bold text-gray-700 dark:text-gray-200 mb-6">
	        <i class="fa-solid fa-users-gear"></i> Create User
	    </h1>
	
	    <!-- Full-Width Form -->
	    <div class="bg-white dark:bg-gray-800 p-8 rounded-lg shadow-lg">
	        <form action="user" method="POST" class="grid grid-cols-1 md:grid-cols-2 gap-6">
	            <!-- Hidden Input for Action -->
	            <input type="hidden" name="action" value="create">
	
	            <div>
	                <label class="block text-gray-700 dark:text-gray-300 font-medium" for="name">
	                    Name
	                </label>
	                <input type="text" name="name" required
	                    class="w-full px-4 py-2 mt-2 border dark:border-gray-600 rounded-lg focus:outline-none focus:ring-1 focus:ring-orange-500/50 dark:bg-gray-700 dark:text-white">
	            </div>
	
	            <div>
	                <label class="block text-gray-700 dark:text-gray-300 font-medium" for="email">
	                    Email
	                </label>
	                <input type="email" name="email" required
	                    class="w-full px-4 py-2 mt-2 border dark:border-gray-600 rounded-lg focus:outline-none focus:ring-1 focus:ring-orange-500/50 dark:bg-gray-700 dark:text-white">
	            </div>
	
	            <div>
	                <label class="block text-gray-700 dark:text-gray-300 font-medium" for="role">
	                    Role
	                </label>
	                <select name="role" required
	                    class="w-full px-4 py-2 mt-2 border dark:border-gray-600 rounded-lg focus:outline-none focus:ring-1 focus:ring-orange-500/50 dark:bg-gray-700 dark:text-white">
	                    <option value="">Select Role</option>
	                    <option value="Admin">Admin</option>
	                    <option value="Pharmacist">Pharmacist</option>
	                    <option value="Store Manager">Store Manager</option>
	                </select>
	            </div>
	
	            <div>
	                <label class="block text-gray-700 dark:text-gray-300 font-medium" for="password">
	                    Password
	                </label>
	                <input type="password" id="password" name="password" required
	                    class="w-full px-4 py-2 mt-2 border dark:border-gray-600 rounded-lg focus:outline-none focus:ring-1 focus:ring-orange-500/50 dark:bg-gray-700 dark:text-white">
	                <p id="passwordError" class="text-red-500 text-sm mt-1 hidden">Password must be at least 8 characters, contain uppercase, lowercase, number, and special character.</p>
	            </div>
	
	            <!-- Buttons -->
	            <div class="md:col-span-2 flex justify-between mt-6">
	                <a href="user" class="bg-gray-500 text-white px-6 py-2 rounded-lg hover:bg-gray-600 transition">
	                    <i class="fa-solid fa-arrow-left"></i> Cancel
	                </a>
	                <button id="submitButton" type="submit" class="bg-orange-500 text-white px-6 py-2 rounded-lg hover:bg-orange-600 transition disabled:opacity-50 disabled:cursor-not-allowed" disabled>
	                    <i class="fa-solid fa-save"></i> Create User
	                </button>
	            </div>
	        </form>
	    </div>
	</main>
	
	<script>
	document.addEventListener("DOMContentLoaded", function () {
	    const passwordInput = document.getElementById("password");
	    const passwordError = document.getElementById("passwordError");
	    const submitButton = document.getElementById("submitButton");
	
	    function validatePassword() {
	        const password = passwordInput.value;
	        // Password validation regex: at least 8 chars, 1 uppercase, 1 lowercase, 1 number, 1 special char
	        const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
	
	        if (!passwordPattern.test(password)) {
	            passwordError.classList.remove("hidden");
	            submitButton.disabled = true;
	        } else {
	            passwordError.classList.add("hidden");
	            submitButton.disabled = false;
	        }
	    }
	
	    passwordInput.addEventListener("input", validatePassword);
	});
	</script>

</body>
</html>