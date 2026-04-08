/*
 * Zalith Launcher 2
 * Copyright (C) 2025 MovTery <movtery228@qq.com> and contributors
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/gpl-3.0.txt>.
 */

package com.movtery.zalithlauncher;

import org.lwjgl.glfw.GLFW;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicLong;

public class CursorRegistry {
    private static final Map<Long, Integer> CURSOR_MAP = new ConcurrentHashMap<>();
    private static final Map<Integer, Long> SHAPE_MAP = new ConcurrentHashMap<>();

    private static final AtomicLong NEXT_ID = new AtomicLong(4L);

    public static final long DEFAULT_CURSOR;

    static {
        DEFAULT_CURSOR = registerCursor(GLFW.GLFW_ARROW_CURSOR);
    }

    public static long registerCursor(int glfwShape) {
        if (SHAPE_MAP.containsKey(glfwShape)) {
            return SHAPE_MAP.get(glfwShape);
        }

        long id = NEXT_ID.getAndIncrement();
        CURSOR_MAP.put(id, glfwShape);
        SHAPE_MAP.put(glfwShape, id);
        return id;
    }

    public static int getShape(long cursor) {
        return CURSOR_MAP.getOrDefault(cursor, GLFW.GLFW_ARROW_CURSOR);
    }

    public static long getDefaultCursor() {
        return DEFAULT_CURSOR;
    }
}
