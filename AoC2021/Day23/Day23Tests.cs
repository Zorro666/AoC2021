using Xunit;
namespace Day23
{

    public class Tests
    {
        [Theory]
        [InlineData(new string[] {
"389125467"
        }, 1, 54673289L)]
        public void Part1(string[] lines, int moves, long expected)
        {
            Assert.Equal(expected, Program.Part1(lines, moves));
        }
    }
}
