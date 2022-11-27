#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>

const double PI = 3.1415926535;

clock_t start, end;

void find_cos(double x, FILE *output) {
    start = clock();
    x = x - (2 * PI) * (int)(x / (2 * PI));
    double result = 0;
    double x_sq = x * x;
    double current = 1;
    int step_num = 0;
    int flag = 1;
    while (step_num < 100) {
        result += flag * current;
        current *= x_sq;
        current /= (step_num + 1) * (step_num + 2);
        step_num += 2;
        flag *= -1;
    }
    end = clock();
    fprintf(output, "cos is %lf\n", result);
    fprintf(output, "Estimated time is %f seconds\n", ((double)(end - start)) / CLOCKS_PER_SEC);
}

void start_default(FILE *input, FILE *output) {
    double x;
    fscanf(input, "%lf", &x);
    find_cos(x, output);
}

void start_rand(FILE *output) {
    srand(time(0));
    double x = rand();
    fprintf(output, "input x is %lf\n", x);
    find_cos(x, output);
}

int main(int argc, char* argv[]) {
    FILE * input = stdin;
    FILE * output = stdout;
    if (argc == 1) {
        start_default(input, output);
    } else {
        if (strcmp(argv[1], "-f") == 0) {
            input = fopen(argv[2], "r");
            output = fopen(argv[3], "w");
            if ((input == NULL) || (output == NULL)) {
                printf("Incorrect input\n");
                return 0;
            }
            start_default(input, output);
            fclose(input);
            fclose(output);
        } else if (strcmp(argv[1], "-r") == 0) {
            start_rand(output);
        } else {
            printf("Incorrect input!\n");
        }
    }
    return 0;
}
