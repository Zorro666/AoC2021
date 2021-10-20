using Xunit;
namespace Day20
{

    public class Tests
    {
        [Theory]
        [InlineData(new string[] {
""
        }, 20899048083289)]
        public void Part1(string[] lines, long expected)
        {
            Assert.Equal(expected, Program.Part1(lines));
        }
    }
}
