# Copyright (C) 2017 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

file(LOCK "${RUN_CMAKE_DIR}/run.lock" DIRECTORY GUARD PROCESS RESULT_VARIABLE locked)

execute_process(
    COMMAND "${CMAKE_COMMAND}" "--build" "${RUN_CMAKE_DIR}" "--target" "${RUN_CMAKE_TARGET}"
    OUTPUT_VARIABLE output
    RESULT_VARIABLE result
)

if(result)
    message("${output}")
    message(FATAL_ERROR "${result}")
endif()
