#include <stdio.h>

int main(int argc, char **argv) {

  if (argc != 4) {
    printf("Wrong number of arguments.\n");
    return -1;
  }

  FILE *fs = fopen("compile_commands.json", "w");

  if (fs == NULL) {
    return -1;
  }

  fprintf(fs,
          "[\n"
          "  {\n"
          "    \"directory\": \"%s\",\n"
          "    \"command\": \"%s\",\n"
          "    \"file\": \"%s\",\n"
          "  },\n"
          "]\n",
          argv[1],
          argv[2],
          argv[3]);

  fclose(fs);

  return 0;
}
