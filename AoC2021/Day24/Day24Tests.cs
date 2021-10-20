using System.Collections.Generic;
using Xunit;
namespace Day24
{

    public class Tests
    {
        [Theory]
        [InlineData(new string[] {
"sesenwnenenewseeswwswswwnenewsewsw",
        }, 54673289L)]
        public void Part1(string[] lines, int expected)
        {
            Assert.Equal(expected, Program.Part1(lines));
        }
    }
}
