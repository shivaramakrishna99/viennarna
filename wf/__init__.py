"""
Assemble and sort some COVID reads...
"""

import subprocess
from pathlib import Path

from latch import small_task, workflow
from latch.types import LatchFile


@small_task
def dot_bracket() -> LatchFile:
    a: int = 10
    return a

@workflow
def rnafold() -> LatchFile:
    """Description...

    markdown header
    ----

    Write some documentation about your workflow in
    markdown here:

    > Regular markdown constructs work as expected.

    # Heading

    * content1
    * content2

    __metadata__:
        display_name: Predict the folded structure of an RNA sequence
        author:
            name:
            email:
            github:
        repository:
        license:
            id: MIT

    Args:

        read1:
          Paired-end read 1 file to be assembled.

          __metadata__:
            display_name: Read1

        read2:
          Paired-end read 2 file to be assembled.

          __metadata__:
            display_name: Read2
    """
    return dot_bracket()
