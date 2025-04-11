document.addEventListener("DOMContentLoaded", function () {

    const labels = monthlySales.map(item => item.MONTH);
    const data = monthlySales.map(item => item.TOTAL_SALES);

    const backgroundColors = ['#FF6384', '#4CAF50', '#36A2EB'];
    const borderColors = ['#FF6384', '#4CAF50', '#36A2EB'];

    const ctx = document.getElementById('monthlySalesChart').getContext('2d');

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: '월별 매출',
                data: data,
                backgroundColor: data.map((_, i) => backgroundColors[i % backgroundColors.length]),
                borderColor: data.map((_, i) => borderColors[i % borderColors.length]),
                borderWidth: 1,
                borderRadius: 10,
                categoryPercentage: 0.3,
                barPercentage: 0.5
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    onClick: null
                },
                tooltip: {
                    callbacks: {
                        label: function (context) {
                            return context.parsed.y.toLocaleString() + '원';
                        }
                    }
                }
            },
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
});
