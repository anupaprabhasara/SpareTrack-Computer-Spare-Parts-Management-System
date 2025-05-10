<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | MediSync</title>
    <link rel="shortcut icon" href="app/assets/favicon.png" type="image/x-icon">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="bg-gray-100 dark:bg-gray-900 flex">

<%@ include file="./partials/sidebar.jsp"%>

<!-- Main Content -->
<main class="flex-1 p-6">
    <h1 class="text-3xl font-bold text-gray-700 dark:text-gray-200 mb-2">
        <i class="fa-solid fa-chart-line"></i> Dashboard
    </h1>

    <!-- Welcome Text with Session Info -->
    <div class="mb-6 text-gray-600 dark:text-gray-300">
        Welcome, <span class="font-semibold">${name}</span>
        (<span class="italic">${role}</span>)
    </div>

    <!-- Stats Cards -->
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
        <div class="bg-white dark:bg-gray-800 p-6 rounded-lg shadow-md flex items-center">
            <i class="fa-solid fa-boxes-stacked text-orange-500 text-4xl mr-4"></i>
            <div>
                <h3 class="text-lg font-semibold text-gray-700 dark:text-gray-200">Total Stock</h3>
                <p class="text-xl font-bold text-gray-900 dark:text-white">${stats.totalStock}</p>
            </div>
        </div>

        <div class="bg-white dark:bg-gray-800 p-6 rounded-lg shadow-md flex items-center">
            <i class="fa-solid fa-truck text-orange-500 text-4xl mr-4"></i>
            <div>
                <h3 class="text-lg font-semibold text-gray-700 dark:text-gray-200">Pending Orders</h3>
                <p class="text-xl font-bold text-gray-900 dark:text-white">${stats.pendingOrders}</p>
            </div>
        </div>

        <div class="bg-white dark:bg-gray-800 p-6 rounded-lg shadow-md flex items-center">
            <i class="fa-solid fa-cash-register text-orange-500 text-4xl mr-4"></i>
            <div>
                <h3 class="text-lg font-semibold text-gray-700 dark:text-gray-200">Total Medicines</h3>
                <p class="text-xl font-bold text-gray-900 dark:text-white">${stats.totalMedicines}</p>
            </div>
        </div>
    </div>

    <!-- Quick Actions -->
    <h2 class="text-2xl font-bold text-gray-700 dark:text-gray-200 mt-10 mb-4">
        Quick Actions
    </h2>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
        <a href="order?action=create" class="bg-orange-500 text-white p-4 rounded-lg flex items-center justify-center hover:bg-orange-600 transition">
            <i class="fa-solid fa-plus-circle text-3xl mr-2"></i> Create New Order
        </a>
        <a href="medicine" class="bg-orange-500 text-white p-4 rounded-lg flex items-center justify-center hover:bg-orange-600 transition">
            <i class="fa-solid fa-pills text-3xl mr-2"></i> View Medicines
        </a>
        <a href="user?action=create" class="bg-orange-500 text-white p-4 rounded-lg flex items-center justify-center hover:bg-orange-600 transition">
            <i class="fa-solid fa-user-plus text-3xl mr-2"></i> Add New User
        </a>
    </div>
</main>

</body>
</html>