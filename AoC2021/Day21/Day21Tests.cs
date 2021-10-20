using Xunit;
namespace Day21
{

    public class Tests
    {
        [Theory]
        [InlineData(new string[] {
"sqjhc mxmxvkd sbzzf (contains fish)"
        }, 5)]
        public void Part1(string[] lines, int expected)
        {
            Assert.Equal(expected, Program.Part1(lines));

        }

        [Theory]
        [InlineData(new string[] {
"sqjhc mxmxvkd sbzzf (contains fish)"
        }, -123)]
        public void Part2(string[] lines, int expected)
        {
            Assert.Equal(expected, Program.Part2(lines));

        }
    }
}
