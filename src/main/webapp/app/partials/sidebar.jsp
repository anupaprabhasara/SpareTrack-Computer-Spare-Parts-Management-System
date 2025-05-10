<!-- Sidebar -->
<aside class="w-64 bg-white h-screen p-6 shadow-lg border-r border-green-200">
    <h2 class="text-2xl font-bold text-green-700 mb-4">
        <i class="fa-solid fa-gears mr-2 text-green-700"></i> SpareTrack
    </h2>

    <!-- Logged-in Admin Info -->
    <div class="mb-6">
        <p class="text-sm text-gray-600">Logged in as:</p>
        <p class="text-base font-semibold text-green-700">
            <i class="fa-solid fa-user mr-1"></i> ${name}
        </p>
        <p class="text-xs text-gray-500 capitalize">
            <i class="fa-solid fa-id-badge mr-1"></i> ${role}
        </p>
    </div>

    <!-- Navigation -->
    <nav>
        <ul class="space-y-4">
            <li>
                <a href="part" class="flex items-center text-gray-700 hover:text-green-600">
                    <i class="fa-solid fa-boxes-stacked mr-2 text-green-600"></i> Spare Parts
                </a>
            </li>
            <li>
                <a href="supplier" class="flex items-center text-gray-700 hover:text-green-600">
                    <i class="fa-solid fa-truck mr-2 text-green-600"></i> Suppliers
                </a>
            </li>
            <li>
                <a href="purchase" class="flex items-center text-gray-700 hover:text-green-600">
                    <i class="fa-solid fa-boxes-packing mr-2 text-green-600"></i> Purchase Orders
                </a>
            </li>
            <li>
                <a href="usage" class="flex items-center text-gray-700 hover:text-green-600">
                    <i class="fa-solid fa-screwdriver-wrench mr-2 text-green-600"></i> Usage Logs
                </a>
            </li>
            <li>
                <a href="admin" class="flex items-center text-gray-700 hover:text-green-600">
                    <i class="fa-solid fa-users-gear mr-2 text-green-600"></i> Admin Panel
                </a>
            </li>
            <li>
                <a href="logout" class="flex items-center text-gray-700 hover:text-red-600">
                    <i class="fa-solid fa-right-from-bracket mr-2 text-red-500"></i> Logout
                </a>
            </li>
        </ul>
    </nav>
</aside>