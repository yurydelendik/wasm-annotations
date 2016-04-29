extern int test(int i);

int test2(int j)
{
  if (j > 0)
    return test(j);
  return 0;
}

int test3(int k) 
{
  if (k < 0) {
    return -test(-k);
  }
  return test2(k);
}
