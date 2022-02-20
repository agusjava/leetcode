class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var counter = 0
        var dayCounter = 1

        var profit = 0
        var maxProfit = 0

        while dayCounter < prices.count {
            if prices[counter] < prices[dayCounter] {
                profit = prices[dayCounter] - prices[counter]
                maxProfit = max(maxProfit, profit)
            } else {
                counter = dayCounter
            }
            dayCounter += 1   
        }
        return maxProfit
    }
}