#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

uint32_t count_leading_zeros(uint32_t x)
{
    x |= (x >> 1);
    x |= (x >> 2);
    x |= (x >> 4);
    x |= (x >> 8);
    x |= (x >> 16);

    /* count ones (population count) */
    x -= ((x >> 1) & 0x55555555 );
    x = ((x >> 2) & 0x33333333) + (x & 0x33333333);
    x = ((x >> 4) + x) & 0x0f0f0f0f;
    x += (x >> 8);
    x += (x >> 16);

    return (32 - (x & 0x7f));
}

void bit_plane_slicing(int caseNum, int size, uint32_t img[])
{   
    int32_t max = -1;

    for (int i = 0; i < size; i++)
    {
        int32_t LZ = (int32_t)count_leading_zeros(img[i]);
        int32_t MSB = 32 - LZ - 1;

        // printf("%d %d\n", LZ, MSB);
        img[i] = MSB;

        if(MSB > max)
        {
            max = MSB;
        }
    }

    printf("Test %d: ", caseNum);
    for (int i = 0; i < size; i++)
    {
        if(img[i] == max)
        {
            img[i] = 255;
        }
        else
        {
            img[i] = 0;
        }
        printf("%u ", img[i]);
    }
    printf("\n");
}

int main()
{
    uint32_t test0[4] = {255, 0, 128, 1};
    uint32_t test1[9] = {167, 133, 111, 144, 140, 135, 159, 154, 148};
    uint32_t test2[6] = {50, 100, 150, 200, 250, 255};

    bit_plane_slicing(0, 4, test0);
    bit_plane_slicing(1, 9, test1);
    bit_plane_slicing(2, 6, test2);

    return 0;
}