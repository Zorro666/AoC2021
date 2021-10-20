using Xunit;
namespace Day03
{

    public class Tests
    {
        [Theory]
        [InlineData(new string[] {
".#..#...#.#"
        }, 2)]
        public void CountTrees(string[] lines, int expected)
        {
            Program.Parse(lines);
            Assert.Equal(expected, int.Parse(lines[0]));
        }
    }
}
