<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit ${admin.fullName} | SpareTrack</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="bg-gray-100 flex">

<%@ include file="../partials/sidebar.jsp"%>

<!-- Main Content -->
<main class="flex-1 p-6">
    <h1 class="text-3xl font-bold text-green-700 mb-6">
        <i class="fa-solid fa-user-pen"></i> Edit ${admin.fullName}
    </h1>

    <div class="bg-white p-8 rounded-lg shadow border border-green-200">
        <form action="admin" method="POST" class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <!-- Hidden Inputs -->
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="${admin.adminId}">

            <div>
                <label class="block text-gray-700 font-medium mb-1" for="username">Username</label>
                <input type="text" name="username" value="${admin.username}" required
                       class="w-full px-4 py-2 border border-green-300 rounded focus:outline-none focus:ring-2 focus:ring-green-400">
            </div>

            <div>
                <label class="block text-gray-700 font-medium mb-1" for="fullName">Full Name</label>
                <input type="text" name="fullName" value="${admin.fullName}" required
                       class="w-full px-4 py-2 border border-green-300 rounded focus:outline-none focus:ring-2 focus:ring-green-400">
            </div>

            <div>
                <label class="block text-gray-700 font-medium mb-1" for="email">Email</label>
                <input type="email" name="email" value="${admin.email}" required
                       class="w-full px-4 py-2 border border-green-300 rounded focus:outline-none focus:ring-2 focus:ring-green-400">
            </div>

            <div>
                <label class="block text-gray-700 font-medium mb-1" for="role">Role</label>
                <select name="role" required
                        class="w-full px-4 py-2 border border-green-300 rounded focus:outline-none focus:ring-2 focus:ring-green-400">
                    <option value="">Select Role</option>
                    <option value="Admin" ${admin.role == 'Admin' ? 'selected' : ''}>Admin</option>
                    <option value="Staff" ${admin.role == 'Staff' ? 'selected' : ''}>Staff</option>
                </select>
            </div>

            <div class="md:col-span-2">
                <label class="block text-gray-700 font-medium mb-1" for="password">Password</label>
                <input type="password" id="password" name="password" value="${admin.password}" required
                       class="w-full px-4 py-2 border border-green-300 rounded focus:outline-none focus:ring-2 focus:ring-green-400">
                <p id="passwordError" class="text-red-500 text-sm mt-1 hidden">
                    Password must be at least 8 characters, with uppercase, lowercase, number, and special character.
                </p>
            </div>

            <!-- Buttons -->
            <div class="md:col-span-2 flex justify-between mt-6">
                <a href="admin" class="bg-gray-500 text-white px-6 py-2 rounded hover:bg-gray-600 transition">
                    <i class="fa-solid fa-arrow-left"></i> Cancel
                </a>
                <button id="submitButton" type="submit"
                        class="bg-green-500 text-white px-6 py-2 rounded hover:bg-green-600 transition disabled:opacity-50 disabled:cursor-not-allowed">
                    <i class="fa-solid fa-save"></i> Save Changes
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
	
	    const criteriaMessage = "Min 8 chars, 1 uppercase, 1 number, 1 special (!@#$%)";
	    const pattern = /^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/;
	
	    function validatePassword() {
	        const value = passwordInput.value;
	        if (value.length === 0) {
	            passwordError.classList.add("hidden");
	            submitButton.disabled = false;
	        } else if (!pattern.test(value)) {
	            passwordError.textContent = criteriaMessage;
	            passwordError.classList.remove("hidden");
	            passwordError.classList.replace("text-green-500", "text-red-500");
	            submitButton.disabled = true;
	        } else {
	            passwordError.textContent = "Password looks good!";
	            passwordError.classList.remove("hidden");
	            passwordError.classList.replace("text-red-500", "text-green-500");
	            submitButton.disabled = false;
	        }
	    }
	
	    passwordInput.addEventListener("input", validatePassword);
	    validatePassword(); // validate on load if value is pre-filled
	});
</script>

</body>
</html>