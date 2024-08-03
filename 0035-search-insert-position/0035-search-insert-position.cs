public class Solution {
    public int SearchInsert(int[] nums, int target) {
        int right=nums.Length-1;
        int left=0;
        int mid=0;
        while(right>=left){
            mid=left+(right-left)/2;
            if(nums[mid]==target){
                return mid;
            }
            else if(nums[mid]>target){
                right=mid-1;
            }else{
                left=mid+1;
            }
        }
        return left;
    }
}