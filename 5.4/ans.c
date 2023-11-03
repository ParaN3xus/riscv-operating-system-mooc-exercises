
int main()
{
    int a = 0x87654321, b, c;
    short tmp;

    b = a >> 16 << 16;
    c = a << 16;
    
    return 0;
}