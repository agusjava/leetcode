class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        /*
        intervals should be sorted before calculating 
        merging since we need to have overlap arrays close
        
        [[1,3],[2,6],[8,10],[15,18]]
          -Overlap-
         .___.
           ._______.
                     .___.
                                   ._____. 
       0_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_

        sort array and then get first element to 
        start counting from position 1 (we got first value)
        if we cannot get an interval we return empty as result

        if first array end is more or equal than next array start
        and
        first array end is less than next array end
        YES -> remove first array (current last)
        YES -> new array has first array start, next array end
        ELSE if first array end is less than next array start
        YES -> next array start, next array end
        NO -> continue
        
        
        [[1,4],[4,5]]

          ._____.
                ._.
        0_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_

        [[1,4],[0,4]]

          ._____.
        ._______.
        0_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_
        
        */
        var sorted = intervals.sorted { $0[0] < $1[0] }
        guard let firstInterval = sorted.first else { return [] }
        var currentInterval = [firstInterval]

        for i in 1..<sorted.count {
            var firstArrayStart = currentInterval.last![0]
            var firstArrayEnd = currentInterval.last![1]

            var nextArrayStart = sorted[i][0]
            var nextArrayEnd = sorted[i][1]

            if firstArrayEnd >= nextArrayStart && firstArrayEnd < nextArrayEnd {
                currentInterval.removeLast()
                currentInterval.append([firstArrayStart, nextArrayEnd])
            } else if firstArrayEnd < nextArrayStart {
                currentInterval.append([nextArrayStart, nextArrayEnd])
            }
        }
        return currentInterval
    }
}
