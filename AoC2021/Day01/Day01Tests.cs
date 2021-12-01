using Xunit;

namespace Day01
{
    public class Tests
    {
        [Theory]
        [InlineData(new int[]
{
199,
200,
208,
210,
200,
207,
240,
269,
260,
263}, 1, 7)]
        [InlineData(new int[]
{
199,
200,
208,
210,
200,
207,
240,
269,
260,
263}, 3, 5)]
        public void CountIncreasesWindow(int[] values, int window, int expected)
        {
            Assert.Equal(expected, Program.CountIncreasesWindow(values, window));
        }
    }
}
