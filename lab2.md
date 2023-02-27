# Lab Report 2

## String Server
![code](images/code.png)

**Example 1**

![first](images/first.png)  

The `handleRequest` method is called each time the url is changed. For this example, the url `localhost:4000/add-message?s=apple` is passed as the argument to `handleRequest`. Since this is the first time that the `add-message` path is called successfully, `str` is still an empty string. The `handleRequest` method splits the parameters of the url's query into an array `{"s", "apple"}`. Then it concatenates a new line (`\n`) and the second element of the array (`"apple"`) to `str`, changing `str` from `" "` to `"apple"`.

**Example 2**

![second](images/second.png)

The `handleRequest` method is called again, this time with the url `localhost:4000/add-message?s=` as the argument. However, this time the query is just `"s="` so the splitting it results in an array of length 1, `{"s"}`. This makes the conditional on line 14 false since the array's length is not greater than 1. Therefore, `str` remains unchanged and is still `apple`. `"404 Not Found"` is returned since this url is not valid.

## Bug in merge method for lists
**Failure inducing input**

```
int[] input2 = { 4, 5, 6};
ArrayExamples.reverseInPlace(input2);
assertArrayEquals(new int[] {6, 5, 4}, input2);
```


![fail](images/fail.png)

**Non-failure inducing input**

```
int[] input1 = {4};
ArrayExamples.reverseInPlace(input1);
assertArrayEquals(new int[] {4}, input1);
```


![unfail](images/unfail.png)

**The bug**

Before

```
static void reverseInPlace(int[] arr) {
    for(int i = 0; i < arr.length; i += 1) {
        arr[i] = arr[arr.length - i - 1];
    }
}
```

After

```
static void reverseInPlace(int[] arr) {
    for (int i = 0; i < arr.length / 2; i += 1) {
        int x = arr[i];
        arr[i] = arr[arr.length - i - 1];
        arr[arr.length - i - 1] = x;
    }
}
```

Before, the values in the second half of the array do not change and the result is not reversed correctly. Now, the for loop only iterates through half the array so that at each index, the value at the current index and the "reversed" index are switched, reversing the array correctly.

## What I Learned
From the Week 2 Lab, I learned how to build a server. I was unfamiliar with the entire process before. Now, I understand how to run both local and remote servers and change server behavior based on the URL inputted. I also learned how ports work and how servers can be run on different ports.